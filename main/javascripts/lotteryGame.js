
var startGameKey = 0;

var speed = 10;

slotIntervalX = 189;

var config = {
    type: Phaser.AUTO,
    width: 1200,
    height: 780,
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

function preload() {
    this.load.image('logo', 'images/lottery/test/logo.png');
    this.load.image('background', 'images/lottery/test/bg2.png');
    this.load.image('number', 'images/lottery/test/number.png');
    this.load.image('next', 'images/lottery/test/next.png');
    this.load.image('time', 'images/lottery/test/time.png');
    this.load.image('prize','images/lottery/test/prize.png');
    this.load.image('start','images/lottery/test/start.png');
    this.load.image('underSlot','images/lottery/test/long.png');
}

function startGame(){
    console.log('hi');
}


function create() {

    var underLayer = this.add.group();

    var bgLayer = this.add.group();

    var topLayer = this.add.group();

    this.slot = [];

    for (i=0;i<5;i++){
        this.slot[i] = underLayer.create(222+i*slotIntervalX,610,'underSlot');
    }
    
    
    bgLayer.create(config.width/2,config.height/2,'background');

    topLayer.create(config.width/2,config.height/2, 'logo');
    topLayer.create(config.width/2,config.height/2, 'number');
    topLayer.create(config.width/2,config.height/2, 'next');
    topLayer.create(config.width/2,config.height/2, 'time');
    topLayer.create(config.width/2,config.height/2, 'prize');

    var startBt = this.add.sprite(1000,700, 'start').setInteractive();


    startBt.on('pointerdown',function(pointer){
        if(startGameKey == 0){
            startGameKey = 1;
            startGame();    
        }
    });
    

}

function update(delta){
    if(startGameKey == 1){
        for(i=0;i<5;i++){
            speed = Math.random()*300+100;
            this.slot[i].y-=speed;
            if(this.slot[i].y<=200){
                this.slot[i].y+=500;
            }
        }
    }
}