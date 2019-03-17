
/* Global Game Variables */
let gameResult;

class sceneMenu extends Phaser.Scene {
	constructor() {
		super({ key: 'sceneMenu' });
	}

	preload() {
		this.load.image('startBg', 'images/baccarat/baccarat_bg.png');
		this.load.image('startBtn', 'images/baccarat/start_button.png');
	}

	create() {
		this.add.image(400, 300, 'startBg').setDisplaySize(800, 600);
		this.startBtn = this.add.sprite(400, 450, 'startBtn').setOrigin(0.5);
		this.startBtn.setInteractive();
		this.startBtn.on('pointerdown', function(pointer) {
			this.scene.start('sceneGame');
		}, this);
	}
}

class sceneGame extends Phaser.Scene {
	constructor() {
		super({ key: 'sceneGame' });
	}

	preload() {
		this.load.image('coin1', 'images/Baccarat/coin_1.png');
		this.load.image('coin2', 'images/Baccarat/coin_5.png');
		this.load.image('coin3', 'images/Baccarat/coin_10.png');
		this.load.image('button', 'images/Baccarat/button.png');
	}

	create() {
		/* Clear BG to Green */
		this.cameras.add(0, 0, 800, 600).setBackgroundColor('rgb(0, 100, 0)');

		/* Variables */
		this.choose = 0;
		this.wallet = 1000;
		this.pause = false;
		this.totalBet = 0;
		this.totalWin = 0;
		this.win = 0;

		/* Print Coins Button & Set Coin Image */
		this.coinMap = [ 'coin1', 'coin2', 'coin3' ];
		this.coinVal = [ 1, 5, 10];
		let coinImg = [];
		for (let i = 0; i < this.coinMap.length; i++) {
			coinImg.push({
				key: i,
				img: this.add.image(30 + 60 * i, 550, this.coinMap[i])
			});
			coinImg[i].img.setDisplaySize(50, 50).setInteractive();
			coinImg[i].img.on('pointerdown', function(pointer) {
				this.choose = coinImg[i]['key'];
			}, this);
		}

		/* Set Board Block */
		class Block {
			constructor(scene, x, y, w, h, startX, startY, repeat, bettingOdds) {
				this.startX = startX;
				this.startY = startY;
				this.repeat = repeat;
				this.bettingOdds = bettingOdds;
				this.rect = scene.add.rectangle(x, y, w, h);
				this.rect.setStrokeStyle(5, 0xffffff).setInteractive();
				this.coins = scene.add.group();
			}
			getPosX(len) {
				return this.startX + Math.floor(len / 10) * 50 - Math.floor(len / (10 * this.repeat)) * (this.repeat * 50 + 20);
			}
			getPosY(len) {
				return this.startY - (len % 10) * 5 - Math.floor(len / (10 * this.repeat)) * 50;
			}
			addCoin(imgKey) {
				let len = this.coins.getLength();
				let c = this.coins.create(this.getPosX(len), this.getPosY(len), imgKey);
				c.setDisplaySize(30, 30).setDepth(100 - Math.floor(len / this.repeat / 10));
			}
		}

		this.blocks = {
			playerWin: new Block(this, 215, 400, 230, 180, 150, 470, 4, 1),
			playerTwin: new Block(this, 245, 250, 290, 90, 150, 275, 5, 11),
			bankerWin: new Block(this, 585, 400, 230, 180, 520, 470, 4, 0.95),
			bankerTwin: new Block(this, 550, 250, 290, 90, 460, 275, 4, 11),
			draw: new Block(this, 400, 400, 100, 180, 400, 470, 2, 8)
		}
		this.keys = Object.keys(this.blocks);
		for (let key of this.keys) {
			this.blocks[key].rect.on('pointerdown', function(pointer) {
				this.blocks[key].addCoin(this.coinMap[this.choose]);
			//	console.log(this.blocks[key].rect.getBounds());
			}, this);
		}

		/* Set Time */
		this.timeText = this.add.text(750, 550, '').setFontSize(40).setOrigin(0.5);
		this.add.arc(750, 550, 40).setStrokeStyle(3, 0xffffff);
		this.timestamp = this.time.now;

		/* Set Money */
		this.walletText = this.add.text(10, 10, 'Wallet: $' + this.wallet.toString(), {
			fontSize: 20,
			color: 'white'
		});
		this.totalBetText = this.add.text(10, 30, 'Total Bet: $' + this.totalBet.toString(), {
			fontSize: 20,
			color: 'white'
		});
		this.winText = this.add.text(10, 50, 'Win: $' + this.win.toString(), {
			fontSize: 20,
			color: 'white'
		});
		this.totalWinText = this.add.text(10, 70, 'Total Win: $' + this.totalWin.toString(), {
			fontSize: 20,
			color: 'white'
		});

		/* Set functional Button */
		let btnClear = this.add.image(0, 0, 'button').setScale(0.7);
		let textClear = this.add.text(0, 0, '取消押注').setFontSize(30).setOrigin(0.5);
		let conClear = this.add.container(300, 550, [ btnClear, textClear ]);
		conClear.setSize(btnClear.width * 0.7, btnClear.height * 0.7).setInteractive();
		conClear.on('pointerdown', function(pointer) {
			conClear.setScale(0.9);
		});
		conClear.on('pointerout', function(pointer) {
			conClear.setScale(1.0);
		});
		conClear.on('pointerup', function(pointer) {
			conClear.setScale(1.0);
			for (let key of this.keys)
				this.blocks[key].coins.clear(true);
		}, this);

		let btnReset = this.add.image(0, 0, 'button').setScale(0.7);
		let textReset = this.add.text(0, 0, '延續上把').setFontSize(30).setOrigin(0.5);
		this.lastState = {};
		for (let key of this.keys)
			this.lastState[key] = [];
		let conReset = this.add.container(500, 550, [ btnReset, textReset ]);
		conReset.setSize(btnReset.width * 0.7, btnReset.height * 0.7).setInteractive();
		conReset.on('pointerdown', function(pointer) {
			conReset.setScale(0.9);
		});
		conReset.on('pointerout', function(pointer) {
			conReset.setScale(1.0);
		});
		conReset.on('pointerup', function(pointer) {
			conReset.setScale(1.0);
			for (let key of this.keys) {
				this.blocks[key].coins.clear(true);
				for (let child of this.lastState[key])
					this.blocks[key].addCoin(child);
			}
		}, this);
	}

	update(time, delta) {
		/* Caculate Money */
		this.totalBet = 0;
		if (this.pause)
			this.win = 0;
		let index = 0;
		for (let key of this.keys) {
			for (let child of this.blocks[key].coins.getChildren()) {
				let val = this.coinVal[this.coinMap.findIndex(element => (element == child.texture.key))];
				this.totalBet += val;
				if (this.pause) {
					this.wallet -= val;
					this.totalWin -= val;
					this.win -= val;
					if (gameResult[index]) {
						let result = val * (1 + this.blocks[key].bettingOdds);
						this.wallet += result;
						this.win += result;
						this.totalWin += result;
					}
				}
			}
			index++;
		}
		Math.round(this.wallet);
		Math.round(this.win);
		Math.round(this.totalWin);
		this.walletText.setText('Wallet: $' + this.wallet.toString());
		this.totalBetText.setText('Total Bet: $' + this.totalBet.toString());
		this.winText.setText('Win: $' + this.win.toString());
		this.totalWinText.setText('Total Win: $' + this.totalWin.toString());

		/* Clear the Board & reCaculate wallet */
		if (this.pause) {
			this.pause = false;
			this.timestamp = this.time.now;
			for (let key of this.keys) {
				this.lastState[key] = [];
				for (let child of this.blocks[key].coins.getChildren())
					this.lastState[key].push(child.texture.key);
				this.blocks[key].coins.clear(true);
			}
		}
		this.timeText.setText(10 - Math.floor((time - this.timestamp) / 1000));

		/* pause this scene & run sceneShow */
		if (time - this.timestamp > 10000) {
			this.pause = true;
			this.scene.pause();
			this.scene.run('sceneShow');
		}
	}
}

class sceneShow extends Phaser.Scene {
	constructor() {
		super({ key: 'sceneShow' });
	}

	preload() {
		this.load.spritesheet('cards', 'images/Baccarat/poker.png', { frameWidth: 73, frameHeight: 98 });
	}

	create() {
		/* Get four cards in the begin */
		let playerCards = [Phaser.Math.Between(0, 51), Phaser.Math.Between(0, 51)];
		let bankerCards = [Phaser.Math.Between(0, 51), Phaser.Math.Between(0, 51)];
		let showCards = this.add.group();
		showCards.create(200, 100, 'cards', playerCards[0]);
		showCards.create(250, 100, 'cards', playerCards[1]);
		showCards.create(505, 100, 'cards', bankerCards[0]);
		showCards.create(555, 100, 'cards', bankerCards[1]);

		/* Count points and check if player/banker need to receive another card */
		function getPoints(cards) {
			let points = 0;
			for (let card of cards)
				points += (card % 13) < 9 ? card % 13 + 1 : 0;
			return (points % 10);
		}
		let playerPoints = getPoints(playerCards);
		let bankerPoints = getPoints(bankerCards);
		// console.log(playerPoints, bankerPoints);

		/* Received New Card - Alert Text */
		let newText = this.add.text(400, 300, '', {
			fontSize: 100,
			color: 'rgb(255, 0, 0)'
		}).setOrigin(0.5).setVisible(false);
		if (playerPoints != 8 && playerPoints != 9 && bankerPoints != 8 && bankerPoints != 9) {
			/* Player received new card */
			if (playerPoints < 6) {
				newText.setText('閒家補牌中。。。').setVisible(true);
				this.time.delayedCall(5000, onPlayerEvent, [], this);
			} else {
				this.time.delayedCall(2000, endEvent, [], this);
			}
		}  else {
			this.time.delayedCall(2000, endEvent, [], this);
		}

		function onPlayerEvent() {
			newText.setVisible(false);
			playerCards.push(Phaser.Math.Between(0, 51));
			playerPoints = getPoints(playerCards);
			showCards.create(300, 100, 'cards', playerCards[2]);
		//	console.log(playerPoints, bankerPoints);

			if ((bankerPoints < 3) || (bankerPoints == 3 && playerPoints != 8)
				|| (bankerPoints == 4 && playerPoints >= 2 && playerPoints <= 7)
				|| (bankerPoints == 5 && playerPoints >= 4 && playerPoints <= 7)
				|| (bankerPoints == 6 && playerPoints >= 6 && playerPoints <= 7)) {
				newText.setText('莊家補牌中。。。').setVisible(true);
				this.time.delayedCall(5000, onBankerEvent, [], this);
			} else {
				this.time.delayedCall(2000, endEvent, [], this);
			}
		}

		function onBankerEvent() {
			newText.setVisible(false);
			bankerCards.push(Phaser.Math.Between(0, 51));
			bankerPoints = getPoints(bankerCards);
			showCards.create(605, 100, 'cards', bankerCards[2]);
		//	console.log(playerPoints, bankerPoints);
			this.time.delayedCall(2000, endEvent, [], this);
		}

		function endEvent() {
			console.log(playerPoints, bankerPoints);
			let playerText = this.add.text(200, 300, '閒家 ' + playerPoints.toString(), {
				fontSize: 100,
				color: 'rgb(255, 0, 0)'
			}).setOrigin(0.5);
			let bankerText = this.add.text(600, 300, '莊家 ' + bankerPoints.toString(), {
				fontSize: 100,
				color: 'rgb(0, 0, 255)'
			}).setOrigin(0.5);
			let winnerText = this.add.text(0, 200, '', {
				fontSize: 80,
				color: 'rgb(0, 255, 0)'
			}).setOrigin(0.5);
			if (playerPoints === bankerPoints)
				winnerText.setText('平手').setX(400);
			else if (playerPoints > bankerPoints)
				winnerText.setText('贏').setX(200);
			else
				winnerText.setText('贏').setX(600);

			gameResult = [
				(playerPoints > bankerPoints),
				(playerCards[0] % 13 === bankerPoints[1] % 13),
				(bankerPoints > playerPoints),
				(bankerCards[0] % 13 === bankerPoints[1] % 13),
				(playerPoints === bankerPoints)
			];

			this.time.delayedCall(3000, function() {
				this.scene.stop();
				this.scene.resume('sceneGame');
			}, [], this);
		}
	}

}

let config = {
	type: Phaser.AUTO,
	width: 800,
	height: 600,
	parent: "game_block",
	scene: [ sceneMenu, sceneGame, sceneShow ]
};

let game = new Phaser.Game(config);