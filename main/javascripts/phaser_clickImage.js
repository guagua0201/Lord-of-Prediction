
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
    var sprite = this.add.sprite(400, 300, 'rabbit').setInteractive();

    sprite.on('pointerdown', function(pointer) {
        this.setTint(0xff0000);
    });

    sprite.on('pointerout', function(pointer) {
        this.clearTint();
    });

    sprite.on('pointerup', function(pointer) {
        this.clearTint();
    });
}