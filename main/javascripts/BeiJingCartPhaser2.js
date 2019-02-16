
console.log('hi');

class sceneStart extends Phaser.Scene{
    constructor() {
        super({key: 'sceneStart'});
    }

    preload(){
        this.load.image('startBg', "images/BeiJingCart/background/STARTBG.png");
        this.load.image('topBar', "images/BeiJingCart/background/TOPBAR.png");
        for(var i=1;i<=10;i++){
            this.load.image('car'+ i.toString(10),'images/BeiJingCart/car/back/car-b' + i.toString(10) + '.png')
        }
    }

    create(){
        this.add.image(0,0,'topBar').setOrigin(0,0);
        this.add.image(0,150,'startBg').setOrigin(0,0);
    }
}

class sceneGame extends Phaser.Scene{
    constructor(){
        super({key: 'sceneGame'});
    }

    preload(){

    }

    create(){

    }

    update(){

    }

}

class sceneEnd extends Phaser.Scene{
    constructor(){
        super({key: 'sceneEnd'});
    }
    
    preload(){

    }

    create(){

    }
}

let config = {
	type: Phaser.AUTO,
	width: 1200,
	height: 780,
	parent: "gameBlock",
	scene: [ sceneStart, sceneGame, sceneEnd ]
};

let game = new Phaser.Game(config);
