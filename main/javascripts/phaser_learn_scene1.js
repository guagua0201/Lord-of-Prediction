class scene1 extends Phaser.Scene {
	constructor() {
		super({key: "scene1"});
	}

	preload() {
		this.load.image('Rabbit', 'images/game/rabbit.jpg');
	}

	create() {
	}
}