
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
        create: create,
        update: update
    }
};

var game = new Phaser.Game(config);
var keyW;
var keyA;
var keyS;
var keyD;
var image;

function preload() {
    this.load.image('rabbit', 'images/Baccarat/rabbit.jpg');
}

function create() {
    image = this.add.image(400, 300, 'rabbit');
    keyW = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.W);
    keyA = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.A);
    keyS = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.S);
    keyD = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.D);
}

function update() {
    if (keyW.isDown) {
        image.y--;
    }

    if (keyA.isDown) {
        image.x--;
    }

    if (keyS.isDown) {
        image.y++;
    }

    if (keyD.isDown) {
        image.x++;
    }

    // console.log(image.x, image.y);
}