
var Scene1 = new Phaser.Class({
	Extends:
		Phaser.Scene,
	initialize:
		function Scene1() {
			Phaser.Scene.call(this, { key: 'Scene1' });
		},

		preload: function() {
			this.load.image('bg', '/images/Baccarat/baccarat_bg.jpg');
			this.load.image('btn', '/images/Baccarat/startbutton.png');
		},

		create: function() {
			this.bg = this.add.image(400, 300, 'bg');
			this.btn = this.add.sprite(400, 450, 'btn');
			this.bg.setDisplaySize(800, 600);
			this.btn.setDisplaySize(100, 100);
			this.btn.setInteractive();

			this.btn.on('pointerdown', function(pointer) {
				this.scene.start('Scene2');
			}, this);
		}
});

var Scene2 = new Phaser.Class({
	Extends:
		Phaser.Scene,
	initialize:
		function Scene2() {
			Phaser.Scene.call(this, { key: 'Scene2' });
		},

		preload: function() {
			this.load.image('block', '/images/Baccarat/block.png');
		}, 

		create: function() {
			this.block = this.physics.add.image(400, 300, 'block');
			this.block.setDisplaySize(50, 50);
			this.cursors = this.input.keyboard.createCursorKeys();
			this.block.setCollideWorldBounds(true);
		},

		update: function() {
			this.block.setVelocity(0);

			if (this.cursors.left.isDown) {
				this.block.setVelocityX(-300);
			}

			if (this.cursors.right.isDown) {
				this.block.setVelocityX(300);
			}

			if (this.cursors.up.isDown) {
				this.block.setVelocityY(-300);
			}

			if (this.cursors.down.isDown) {
				this.block.setVelocityY(300);
			}
		}
});

var config = {
	type: Phaser.AUTO,
	width: 800,
	height: 600,
	parent: 'game_block',
	physics: {
		default: 'arcade'
	},
	scene: [ Scene1, Scene2 ]
}

var game = new Phaser.Game(config);