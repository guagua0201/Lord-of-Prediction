

var gameStartKey = 0;

var nowRank;

var numberBall;

var openSound = 1;

var timeStart;

var totalTime = 14 * 1000;

var trafficLight;

var bgImg;

var nowX = 0;

var totalLen = 11800;

var cars;

var rank;

var lastPos;

class myImg{
    constructor(src,x,y){
        this.x = x;
        this.y = y;
        this.img = new Image();
        this.img.src = src;
    }
}

class car{
    constructor(pos,target,imgNum,final){
        this.lastTime = 4500;
        this.pos = this.lastPos = pos;
        this.target = target;
        this.imgs = [];
        this.final = final;
    }
}

function insideSoundButton(x,y,but){
    var r = 25;
    var cenX = but.x+58;
    var cenY = but.y+58;
    var dis = (x - cenX) * (x - cenX) + (y - cenY) * (y - cenY);
    return dis<=r*r;
}

function randomRank(){
    var mk = [];
    for(i=1;i<=10;i++){
        mk[i] = 0;
    }
    rank = [];
    for(i=1;i<=10;i++){
        while(1){
            rank[i] = Math.floor(Math.random()*10)+1;
            if(mk[rank[i]] == 0){
                mk[rank[i]] = 1;
                break;
            }
        }
    }
    return rank;
}

function init(){

    lastPos = [];
    for(i=1;i<=10;i++){
        lastPos[i] = 1000-i*90;
    }

    rank = [];
    for(i=1;i<=10;i++){
        rank[i] = i;
        
    }
    rank = randomRank();



    canvas = document.getElementById('myCanvas');
    context = canvas.getContext('2d');

    nowRank = [];
    numberBall = [];
    for(i=1;i<=10;i++){
        nowRank[i] = i;
        numberBall[i] = new myImg("images/BeiJingCart/number/" + i.toString(10) + ".png",220+i*55,50);
    }

    var topBar = new myImg("images/BeiJingCart/background/TOPBAR.png",0,0);
    topBar.img.onload = function(){
        context.drawImage(topBar.img,topBar.x,topBar.y);
        for(i=1;i<=10;i++){
            context.drawImage(numberBall[i].img,numberBall[i].x,numberBall[i].y);
        }
    }

    var soundBut = new myImg("images/BeiJingCart/sound/OPEN.png",1100,20);
    soundBut.img.onload = function(){
        context.drawImage(soundBut.img,soundBut.x,soundBut.y);
        context.font="25px Georgia";
        context.fillStyle="white";
        context.fillText("期號: 722052",870,70,1000);
        context.fillText("時間: 12-24 23:57",870,110,1000);

           
    }

    
    
    

    canvas.addEventListener('click',function(evt){
        var mousePos = getMousePos(canvas,evt);
        console.log(mousePos.x,mousePos.y);
        if(insideSoundButton(mousePos.x,mousePos.y,soundBut)){
            if(openSound==1){
                console.log('mute');
                openSound = 0;
                soundBut.img.src = "images/BeiJingCart/sound/MUTE.png";
            }
            else{
                console.log('open sound');
                openSound = 1;
                soundBut.img.src = "images/BeiJingCart/sound/OPEN.png";
            }
        }
    },false);


}

function insideButton(x,y,but){
    var r = 69;
    var cenX = but.x+100;
    var cenY = but.y+100;
    var dis = (x - cenX) * (x - cenX) + (y - cenY) * (y - cenY);
    return dis<=r*r;
}

function getMousePos(canvas, event) {
    var rect = canvas.getBoundingClientRect();
    return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
    };
}

function startScreen(){

    
    var carBack = [];

    for ( i = 1 ; i <= 10 ; i ++ ){
        carBack[i] = new myImg("images/BeiJingCart/car/back/car-b" + i.toString(10) + ".png",-60+i*110,600);
    }

    var startBG = new myImg("images/BeiJingCart/background/STARTBG.png",0,150);

    startBG.img.onload = function(){
        context.drawImage(startBG.img,startBG.x,startBG.y);
        for ( i = 1 ; i <= 10 ; i ++){
            context.drawImage(carBack[i].img,0,0,carBack[i].img.width,carBack[i].img.height,carBack[i].x,carBack[i].y,120,100);
        }
    }

    trafficLight = new myImg("images/BeiJingCart/trafficLight/RED.png",900,300);
    trafficLight.img.onload = function(){
        context.drawImage(trafficLight.img,trafficLight.x,trafficLight.y);
    }


    var startButton = new myImg("images/BeiJingCart/startButton/START.png",500,300);

    startButton.img.onload = function(){
        context.drawImage(startButton.img,startButton.x,startButton.y);    
    }


    canvas.addEventListener('click',function(evt){
        var mousePos = getMousePos(canvas,evt);
        if(insideButton(mousePos.x,mousePos.y,startButton)){
            gameStartKey = 1;
            this.removeEventListener('click',arguments.callee,false);
            startGame();
            return ;
        }
    },false);

    canvas.addEventListener('mousemove',function(evt){
        if(gameStartKey==1){
            this.removeEventListener('mousemove',arguments.callee,false);
        }
        var mousePos = getMousePos(canvas,evt);
        if(insideButton(mousePos.x,mousePos.y,startButton)) {
            startButton.img.src = "images/BeiJingCart/startButton/STARTLIGHT.png"
        }
        else{
            startButton.img.src = "images/BeiJingCart/startButton/START.png";
        }
    },false);

}

function elapsedTime(){
    var nowTime = Date.now();
    return nowTime - timeStart;
}

function stopGame(){
    cancelAnimationFrame(aniReq);
    playEnd();
}

function drawCanvas(){
    var et = elapsedTime();
    if(et <= 4500){
        if(et <= 1500) trafficLight.img.src = "images/BeiJingCart/trafficLight/RED.png";
        else if(et <= 3000) trafficLight.img.src = "images/BeiJingCart/trafficLight/YELLOW.png";
        else trafficLight.img.src = "images/BeiJingCart/trafficLight/GREEN.png";
    }
    else if(et<=totalTime){
        nowX = totalLen * et / totalTime;
        context.drawImage(bgImg,nowX,0,1200,630,0,150,1200,630);

        for(i=1;i<=10;i++){

            var nowImg = cars[i].imgs[Math.floor(Math.random() * 3)];

            context.drawImage(nowImg,0,0,nowImg.width,nowImg.height,cars[i].pos,200+i*45,150,80);
        }

    }
    else{
        context.drawImage(bgImg,nowX,0,1200,630,0,150,1200,630);
        for(i=1;i<=10;i++){

            var nowImg = cars[i].imgs[Math.floor(Math.random() * 3)];

            context.drawImage(nowImg,0,0,nowImg.width,nowImg.height,cars[i].pos,200+i*45,150,80);
        }
    }
    if(et > totalTime + 4500){
        stopGame();
    }
}

function findTarget(c){
    var et = elapsedTime();
    var rangeL,rangeR;
    rangeL = Math.max(50,c.pos-300);
    rangeR = Math.min(900,c.pos+300);
    var rad = (totalTime - et) * 30 / 1000;
    rangeL = Math.max(rangeL,c.final-rad);
    rangeR = Math.min(rangeR,c.final+rad);
    //console.log(rangeL,rangeR);
    var tar = rangeL + Math.random() * (rangeR - rangeL);
    return tar;
}

function updateCars(){
    var et = elapsedTime();
    if(et<4500) return ;
    if(et>totalTime+3000){
        for(i=1;i<=10;i++){
            if(et - cars[i].lastTime >= 1500){
                cars[i].lastTime = et;
                cars[i].lastPos = cars[i].pos;
                cars[i].target = cars[i].pos+1500;
                console.log(cars[i].target);
            }
            cars[i].pos = cars[i].lastPos + (cars[i].target-cars[i].lastPos) * (et - cars[i].lastTime) / 1000;
        }
        return ;
    }
    if(et<=totalTime){
        for(i=1;i<=10;i++){
            if(et - cars[i].lastTime >= 1000){
                cars[i].lastTime = et;
                cars[i].lastPos = cars[i].pos;
                cars[i].target = findTarget(cars[i]);
            }
            cars[i].pos = cars[i].lastPos + (cars[i].target-cars[i].lastPos) * (et - cars[i].lastTime) / 1000;
            //if(i==1) console.log(cars[i].pos,cars[i].target,cars[i].lastPos,cars[i].lastTime);
        }

    }
}

function animate(){
    aniReq = requestAnimationFrame(animate);

    updateCars();

    drawCanvas();
}

function startGame(){
    bgImg = new Image();
    bgImg.src = "./images/BeiJingCart/background/bg.png";

    cars = [];
    
    for (i=1;i<=10;i++){
        var randomTar = Math.random() * 400 + 50;
        cars[i] = new car(50,randomTar,i,lastPos[rank[i]]);
        for ( j = 0 ; j < 3 ; j ++ ){
            cars[i].imgs[j] = new Image();
            cars[i].imgs[j].src = "./images/BeiJingCart/car/side/group" + (j+1).toString(10) + "/carS" + i.toString(10) + ".png";
        }
    }

    timeStart = Date.now();
    
    animate();
    
}

function playEnd(){
    var endImg = new Image();
    endImg.src = "./images/BeiJingCart/background/winbg.png";
    endImg.onload = function(){
        context.drawImage(endImg,0,150);
    }
}


init();

startScreen();

