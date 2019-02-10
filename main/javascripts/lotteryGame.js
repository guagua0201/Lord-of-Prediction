
var nowNumber=-100;
var result;

for (var key in resultArr){
    console.log(key + " = " + resultArr[key]);
    if(key > nowNumber){
        nowNumber = key;
        result = resultArr[key];
    }
}

class sceneStart extends Phaser.Scene{
    constructor(){
        super({key: "sceneStart"});
    }

    preload(){
        this.load.image("underBar","images/lottery/five.png");
        
        for(var i=1;i<=5;i++){
            this.load.image("num"+i.toString(10),"images/lottery/number"+i.toString(10)+".png");
        }
        
        this.load.image("bg","images/lottery/bg2.png");

        this.load.image("startBut","images/lottery/start.png");

        this.load.image("startButLight","images/lottery/startlight.png");
    }

    create(){

        var intervalX = 189;

        var intervalY = 132;

        this.add.image(0,0,"underBar").setOrigin(0,0);

        for(var i=1;i<=5;i++){
            this.add.image(intervalX*i+35,370,"num" + i.toString(10));
            //this.add.image(intervalX*i+35,1020,"num" + i.toString(10));
        }


        this.add.image(0,0,"bg").setOrigin(0,0);

        var butX = 1125;
        var butY = 436;
        var barRad = 52;


        this.startBut = this.add.sprite(600,390,"startBut");
        this.startBut.setInteractive();
        

        this.startButLight = this.add.sprite(600,390,"startButLight");
        this.startButLight.setInteractive();
        this.startButLight.visible = 0;

        var textSpacing = 50;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<nowNumber.length;i++){
            this.add.text(310+textSpacing*i, 75, nowNumber[i], { fontSize: '32px', fill: 'white' });
        }
        
        this.add.text(1000, 16, result, { fontSize: '32px', fill: 'white' });

    }

    update(){
        var butX = 1125;
        var butY = 436;
        var barRad = 52;

        var mouseX = game.input.mousePointer.x;
        var mouseY = game.input.mousePointer.y;
        var dis = (butX - mouseX) * (butX - mouseX) + (butY - mouseY) * (butY - mouseY);
        if(dis < 52*52){
            this.startButLight.visible = 1;
        }
        else{
            this.startButLight.visible = 0;
        }

        if (game.input.mousePointer.isDown)
        {
            var mouseX = game.input.mousePointer.x;
            var mouseY = game.input.mousePointer.y;
            var dis = (butX - mouseX) * (butX - mouseX) + (butY - mouseY) * (butY - mouseY);
            if(dis < 52*52){
                this.scene.start("sceneGame");
            }
        }

    }
}

var startTime,nowTime;

var numberEnd;



var stopKey;

var stopCnt;

class sceneGame extends Phaser.Scene{
    constructor(){
        super({key: "sceneGame"});
    }

    preload(){
        this.load.image("underBar","images/lottery/five.png");
        
        for(var i=1;i<=5;i++){
            this.load.image("num"+i.toString(10),"images/lottery/number"+i.toString(10)+".png");
        }
        
        this.load.image("bg","images/lottery/bg2.png");

        this.load.image("startBut","images/lottery/start.png");

        this.load.image("startButLight","images/lottery/startlight.png");
    }

    create(){

        stopCnt = 0;
        stopKey = [0,0,0,0,0,0];

        result = [];

        for(var i=1;i<=5;i++){
            result[i] = Math.floor(Math.random()*10);
            if(result[i] == 10) result[i] = 9;

            console.log(result[i]);
        }

        var intervalY = 132;
        numberEnd = [];
        for(var i=10;i>=0;i--){
            numberEnd[i] = 370 + (10-i)*intervalY;
            while(numberEnd[i] > 1400){
                numberEnd[i] -= 1327;
            }
        }

        for(var i=0;i<=9;i++){
            console.log(numberEnd[i])
        }
        
        startTime = Date.now();

        var intervalX = 189;

        var intervalY = 132;

        this.add.image(0,0,"underBar").setOrigin(0,0);


        this.numBar = [];
        var last = 0;
        for(var i=1;i<=5;i++){
            this.numBar[i] = this.physics.add.sprite(intervalX*i+35,370,"num" + i.toString(10));
            //game.physics.enable(numBar[i], Phaser.Physics.ARCADE);
            console.log(this.numBar[i]);
            if(i==1){
                last = Math.random() * 500 + 2000;
                this.numBar[i].setVelocityY(last);
                
            }
            else if(i==5){
                this.numBar[i].setVelocityY(5000);
            }
            else{
                last = Math.random() * 200 + last + 300;
                this.numBar[i].setVelocityY(last);
            }
            //this.physics.moveTo(this.numBar[i],this.numBar[i].x,this.numBar[i].y+500,100);
            //this.add.image(intervalX*i+35,1020,"num" + i.toString(10));
        }


        this.add.image(0,0,"bg").setOrigin(0,0);

        var butX = 1125;
        var butY = 436;
        var barRad = 52;


        this.startBut = this.add.sprite(600,390,"startBut");
        this.startBut.setInteractive();
        

        this.startButLight = this.add.sprite(600,390,"startButLight");
        this.startButLight.setInteractive();
        this.startButLight.visible = 0;

        writeText();

    }

    update(){
        var butX = 1125;
        var butY = 436;
        var barRad = 52;

        var mouseX = game.input.mousePointer.x;
        var mouseY = game.input.mousePointer.y;
        var dis = (butX - mouseX) * (butX - mouseX) + (butY - mouseY) * (butY - mouseY);
        if(dis < 52*52){
            this.startButLight.visible = 1;
        }
        else{
            this.startButLight.visible = 0;
        }

        for(var i=1;i<=5;i++){
            if(this.numBar[i].y > 1400){
                this.numBar[i].y -= 1327;
            }
            if(this.numBar[i].y < 0){
                this.numBar[i].y += 1327;
            }
        }
        nowTime = Date.now();
        //console.log(nowTime - startTime);
        
        
        for(var i=1;i<=5;i++){
          //  console.log(i,this.numBar[i].body.newVelocity.y);
            if(stopKey[i] > 0){
                //if(i==1) console.log(this.numBar[i].body.y,numberEnd[result[i]]+30);
                var dis = numberEnd[result[i]] - this.numBar[i].y;
           //     if(i==1) console.log(dis);
                
                if(dis < -50){
                    this.numBar[i].setVelocityY(300);
                }
                else if(dis < -20){
                    this.numBar[i].setVelocityY(100);
                }
                else if(dis<-10){
                    this.numBar[i].setVelocityY(5);
                }

                if(dis > 50){
                    this.numBar[i].setVelocityY(300);
                }
                else if(dis > 40){

                    this.numBar[i].setVelocityY(250);
                }   
                else if(dis>20){
                    this.numBar[i].setVelocityY(200);
                }
                else if(dis>10){
                    this.numBar[i].setVelocityY(50);
                }
                else if(dis>4){
                    this.numBar[i].setVelocityY(4);
                }
                if(Math.abs(dis)<5){
                    this.numBar[i].setAccelerationY(0);
                    this.numBar[i].setVelocityY(0);
                    if(stopKey[i] == 1){
                        stopKey[i] = 2;
                        stopCnt++;
                        if(stopCnt == 5){
                            this.scene.start("sceneEnd");
                        }
                    }
                    
                }
            }
            else{
                var stopTime;stopTime = 2000;
                if(nowTime - startTime > stopTime ){
                    if(this.numBar[i].body.velocity.y > 200){
                        if(i==5 && this.numBar[i].body.velocity.y < 1000){
                            this.numBar[i].setAccelerationY(-200);    
                        }
                        else this.numBar[i].setAccelerationY(-800);
                    }
                    else{
                        this.numBar[i].setAccelerationY(0);
                        stopKey[i] = 1;
                        console.log("stop" + i.toString(10));
                        //this.physics.moveTo(this.numBar[i],this.x,numberEnd[result[i]]+30,100);
                    }
                }
            }
        }
    }
}

class sceneEnd extends Phaser.Scene{
    constructor(){
        super({key: 'sceneEnd'});
    }
    preload(){
        this.load.image("underBar","images/lottery/five.png");
        
        for(var i=1;i<=5;i++){
            this.load.image("num"+i.toString(10),"images/lottery/number"+i.toString(10)+".png");
        }
        
        this.load.image("bg","images/lottery/bg3.png");

        this.load.image("startBut","images/lottery/start.png");

        this.load.image("startButLight","images/lottery/startlight.png");
    }
    create(){

        var intervalX = 189;

        var intervalY = 132;

        this.add.image(0,0,"underBar").setOrigin(0,0);

        this.numBar = [];
        var last = 0;
        for(var i=1;i<=5;i++){
            this.numBar[i] = this.physics.add.sprite(intervalX*i+35,numberEnd[result[i]],"num" + i.toString(10));
        }
        
        this.add.image(0,0,"bg").setOrigin(0,0);

        var butX = 1125;
        var butY = 436;
        var barRad = 52;


        this.startBut = this.add.sprite(600,390,"startBut");
        this.startBut.setInteractive();
        

        this.startButLight = this.add.sprite(600,390,"startButLight");
        this.startButLight.setInteractive();
        this.startButLight.visible = 0;
        console.log("end");

        writeText();

    }

    update(){
        var butX = 1125;
        var butY = 436;
        var barRad = 52;

        var mouseX = game.input.mousePointer.x;
        var mouseY = game.input.mousePointer.y;
        var dis = (butX - mouseX) * (butX - mouseX) + (butY - mouseY) * (butY - mouseY);
        if(dis < 52*52){
            this.startButLight.visible = 1;
        }
        else{
            this.startButLight.visible = 0;
        }
    }
}


var config = {
    type: Phaser.AUTO,
    width: 1190,
    height: 720,
    parent: "gameBlock",
    physics: {
        default: 'arcade',
    },
    scene: [ sceneStart,sceneGame,sceneEnd ]
};


var game = new Phaser.Game(config);