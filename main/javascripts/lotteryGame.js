
var nowNumber=-100;
var award;

for (var key in resultArr){
    console.log(key + " = " + resultArr[key]);
    if(key > nowNumber){
        nowNumber = key;
        award = resultArr[key];
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
        
        this.load.image("bg","images/lottery/bg4.png");

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

        textSpacing = 13;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        
        //this.add.text(1000, 80, result, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<award.length;i++){
            this.add.text(985+textSpacing*i, 80, award[i], { fontSize: '32px', fill: 'white' });
        }

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

var result;

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
        
        this.load.image("bg","images/lottery/bg4.png");

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

        var textSpacing = 50;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<nowNumber.length;i++){
            this.add.text(310+textSpacing*i, 75, nowNumber[i], { fontSize: '32px', fill: 'white' });
        }
        
        textSpacing = 13;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        
        //this.add.text(1000, 80, result, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<award.length;i++){
            this.add.text(985+textSpacing*i, 80, award[i], { fontSize: '32px', fill: 'white' });
        }

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
                    this.numBar[i].setVelocityY(20);
                }
                if(Math.abs(dis)<2){
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
            //this.load.image("num"+i.toString(10),"images/lottery/number"+i.toString(10)+".png");
            this.load.image("num"+i.toString(10)+"_"+result[i],"images/lottery/number"+i.toString(10) + "_" + result[i] + ".png");
            this.load.image("num"+i.toString(10)+"_"+(result[i]+9)%10,"images/lottery/number"+i.toString(10) + "_" + (result[i]+9)%10 + ".png");
            this.load.image("num"+i.toString(10)+"_"+ (result[i]+1)%10,"images/lottery/number"+i.toString(10) + "_" + (result[i]+1)%10 + ".png");
        }
        
        this.load.image("bg","images/lottery/bg4.png");

        this.load.image("startBut","images/lottery/start.png");

        this.load.image("startButLight","images/lottery/startlight.png");

        this.load.image("big","images/lottery/big.png");
        this.load.image("small","images/lottery/small.png");
        this.load.image("even","images/lottery/even.png");
        this.load.image("odd","images/lottery/odd.png");

    }
    create(){

        var intervalX = 189;

        var intervalY = 132;

        this.add.image(0,0,"underBar").setOrigin(0,0);

        this.numBar = [];
        this.upBar = [];
        this.downBar = [];
        this.numMid = [];
        this.numUp = [];
        this.numDown = [];
        var last = 0;
        for(var i=1;i<=5;i++){
            //this.numBar[i] = this.physics.add.sprite(intervalX*i+35,numberEnd[result[i]],"num" + i.toString(10));
            this.numMid[i] = this.physics.add.sprite(intervalX*i+35,415 ,"num"+i.toString(10)+"_"+result[i]);
            if(result[i]>=5) this.upBar[i] = this.physics.add.sprite(intervalX*i+35,415-132,"big");
            else this.upBar[i] = this.physics.add.sprite(intervalX*i+35,415-132,"small");
            if(result[i]%2==1) this.downBar[i] = this.physics.add.sprite(intervalX*i+35,415+132,"odd");
            else this.downBar[i] = this.physics.add.sprite(intervalX*i+35,415+132,"even");
            
            var f = result[i]-1;
            if(f == -1) f = 9;
            this.numUp[i] = this.physics.add.sprite(intervalX*i+35,415-132 ,"num"+i.toString(10)+"_"+f);
            f = result[i]+1;
            if(f==10) f = 0;
            this.numDown[i] = this.physics.add.sprite(intervalX*i+35,415+132 ,"num"+i.toString(10)+"_"+f);

            this.upBar[i].alpha = 0;
            this.downBar[i].alpha = 0;
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

        var textSpacing = 50;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<nowNumber.length;i++){
            this.add.text(310+textSpacing*i, 75, nowNumber[i], { fontSize: '32px', fill: 'white' });
        }
        
        textSpacing = 13;
        //this.add.text(300, 75, nowNumber, { fontSize: '32px', fill: 'white' });
        
        //this.add.text(1000, 80, result, { fontSize: '32px', fill: 'white' });
        for (var i=0;i<award.length;i++){
            this.add.text(985+textSpacing*i, 80, award[i], { fontSize: '32px', fill: 'white' });
        }

        



        this.bigWhite = this.add.rectangle(1190/2,720/2,1190,720);
        this.bigWhite.setFillStyle(0xffffff).setInteractive();
        console.log(this.bigWhite);
        //underBarBlock.z = 1;

        
        startTime = Date.now()+200;
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


        nowTime = Date.now() - startTime;
        if(nowTime<0) this.bigWhite.alpha = 1;
        else{
            if(nowTime > 20000){
                this.scene.start("sceneStart");
            }
            this.bigWhite.alpha = 0;
            var flipTime = 2000;
            for(var i=1;i<=5;i++){
                var nowRatio = Math.min(nowTime/flipTime,1);
                this.upBar[i].alpha = this.downBar[i].alpha = nowRatio;
                this.numUp[i].alpha = this.numDown[i].alpha = 1-nowRatio;

            }
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