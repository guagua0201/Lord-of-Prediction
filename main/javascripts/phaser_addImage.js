
var config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    parent: "game_block",
    physics: {
        default: 'arcade'
    },
    scene: {
        preload: preload,
        create: create
    }
};

var game = new Phaser.Game(config);

function preload() {
    this.load.image('rabbit', 'images/Baccarat/rabbit.jpg');
}

function create() {
    this.add.image(400, 300, 'rabbit');
}