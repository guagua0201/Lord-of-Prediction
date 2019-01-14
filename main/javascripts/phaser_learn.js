
var config = {
	type: Phaser.AUTO,
	widht: 800,
	height: 600,
	physics: {
		default: 'arcade',
		arcade: {
			gravity: {y: 200}
		}
	},
	scenes: [ scene1 ]
}