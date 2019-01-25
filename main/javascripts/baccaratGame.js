
class sceneMenu extends Phaser.Scene {
	constructor() {
		super({ key: 'sceneMenu' });
	}

	preload() {
		this.load.image('startBg', 'images/Baccarat/baccarat_bg.jpg');
		this.load.image('startBtn', 'images/Baccarat/startbutton.png');
	}

	create() {
		this.add.image(400, 300, 'startBg').setDisplaySize(800, 600);
		this.startBtn = this.add.sprite(400, 450, 'startBtn');
		this.startBtn.setDisplaySize(100, 100).setInteractive();
		this.startBtn.on('pointerdown', function(pointer) {
			this.scene.start('sceneGame');
		}, this);
	}
}

class sceneGame extends Phaser.Scene {
	constructor() {
		super({ key: 'sceneGame' });

		/* variables */
		this.wallet = 1000;
		this.choose = 0;
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

		/* Print Coins Button & Set Coin Image */
		let coinMap = [ 'coin1', 'coin2', 'coin3' ];
		let coinImg = [];
		for (let i = 0; i < coinMap.length; i++) {
			coinImg.push({
				key: i,
				img: this.add.image(30 + 60 * i, 550, coinMap[i])
			});
			coinImg[i].img.setDisplaySize(50, 50).setInteractive();
			coinImg[i].img.on('pointerdown', function(pointer) {
				this.choose = coinImg[i]['key'];
			}, this);
		}

		/* Set Board Block */
		class Block {
			constructor(scene, x, y, w, h, startX, startY, repeat) {
				this.startX = startX;
				this.startY = startY;
				this.repeat = repeat;
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
			playerWin: new Block(this, 215, 400, 230, 180, 150, 470, 4),
			playerTwin: new Block(this, 245, 250, 290, 90, 150, 275, 5),
			bankerWin: new Block(this, 585, 400, 230, 180, 520, 470, 4),
			bankerTwin: new Block(this, 550, 250, 290, 90, 460, 275, 4),
			flat: new Block(this, 400, 400, 100, 180, 400, 470, 2)
		}
		this.keys = Object.keys(this.blocks);
		for (let key of this.keys) {
			this.blocks[key].rect.on('pointerdown', function(pointer) {
				this.blocks[key].addCoin(coinMap[this.choose]);
			}, this);
		}

		/* Set Time */
		this.timeText = this.add.text(750, 550, '', {
			fontSize: '40px'
		}).setOrigin(0.5);
		this.add.arc(750, 550, 40).setStrokeStyle(3, 0xffffff);
		this.timestamp = this.time.now;

		/* Set functional Button */
		let btnClear = this.add.image(0, 0, 'button').setScale(0.7);
		let textClear = this.add.text(0, 0, '取消押注').setStyle({
			fontSize: '30px'
		}).setOrigin(0.5);
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
		let textReset = this.add.text(0, 0, '延續上把').setStyle({
			fontSize: '30px'
		}).setOrigin(0.5);
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
		this.timeText.setText(30 - Math.floor((time - this.timestamp) / 1000));
		if (time - this.timestamp > 30000) {
			// pause this scene & run sceneShow
			this.timestamp = this.time.now;
			for (let key of this.keys) {
				this.lastState[key] = [];
				for (let child of this.blocks[key].coins.getChildren())
					this.lastState[key].push(child.texture.key);
				this.blocks[key].coins.clear(true);
			}
		}
	}
}

let config = {
	type: Phaser.AUTO,
	width: 800,
	height: 600,
	parent: "game_block",
	scene: [ sceneMenu, sceneGame ]
};

let game = new Phaser.Game(config);