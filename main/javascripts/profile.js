var canvas = document.getElementById("renderCanvas");

var backButton = [];

console.log("gender",userGender);
console.log("hi ",userName);

var suitID,shoeID,hairID,genderS;

var productCate;

if(userGender == 0){
    
    suitID = 4;
    shoeID = 2;
    hairID = 1;
}
else{
    suitID = 10;
    shoeID = 8;
    hairID = 6;
}

jQuery.ajax({
    type: "POST",
    url: 'php/profileGet.php',
    dataType: 'json',
    data: {arguments: [userName]},

    success: function (obj, textstatus) {
                  if( !('error' in obj) ) {
                      var phpGender = obj.gender;
                      console.log("obj = ",obj);
                      console.log("result",phpGender);
                      var phpAcc = obj.ownAcc;
                      console.log("acc = ",phpAcc);
                      for(var i=0;i<10;i++){
                          console.log(i," = ",phpAcc[i]);
                      }
                      console.log("cate = ",obj.productCate);
                      console.log("yesCnt = ",obj.yesCnt);
                      productCate = obj.productCate;
                  }
                  else {
                      console.log("error",obj.error);
                  }
            }
});

var globalMesh = [];


var createScene = function () {

    

    var loadMesh = function (scene,path,name,posX,posY,posZ,part){
        
        var mesh = BABYLON.SceneLoader.ImportMesh("", path, name, scene, function (newMeshes){
            globalMesh[part] = newMeshes;
            for(var i=0;i<newMeshes.length;i++){
                newMeshes[i].position = new BABYLON.Vector3(posX,posY,posZ);
                //newMeshes[i].dispose();
            }
        });

        return mesh;
    }
    
    var setTime = function(scene){
        var timeH=new Date(Date.now()).getHours();
    
        if(timeH == -100){
            scene.clearColor = new BABYLON.Color3(0.3921,0.584,0.929);  
        }
        else{
            scene.clearColor = new BABYLON.Color3(0.2,0.2,0.3);  

            var spaceRad = 10000;

            var starNum = 100;
        
            for(var i=0;i<starNum;i++){
                var d = 0;
                var pos = new BABYLON.Vector3(0,0,0);
                do{
                    pos.x = Math.random() * spaceRad - spaceRad/2;
                    pos.y = Math.random() * 1000 - 500;
                    pos.z = Math.random() * spaceRad - spaceRad/2;
                d = pos.x*pos.x + pos.y*pos.y + pos.z*pos.z;
                }while(d < 10000000);
                var marker = BABYLON.Mesh.CreateSphere('cmarker', 30, 10, scene);
                marker.position = pos;
            }
        }
    }

    var doActionManager = function(scene){
        scene.actionManager = new BABYLON.ActionManager(scene);

        scene.actionManager.registerAction(
        new BABYLON.ExecuteCodeAction(
                {
                    trigger: BABYLON.ActionManager.OnKeyDownTrigger,
                    parameter: 37
                },
                function () { 
                    
                    var nowPos = new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z);
                    
                    if(nowPos.x<200) nowPos.x+=20;
                    //console.log(nowPos.x);
                    camera.setPosition(nowPos);
                }
            )
        );
        scene.actionManager.registerAction(
        new BABYLON.ExecuteCodeAction(
                {
                    trigger: BABYLON.ActionManager.OnKeyDownTrigger,
                    parameter: 39
                },
                function () { 
                    
                    var nowPos = new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z);
                    if(nowPos.x>-200) nowPos.x-=20;
                    //console.log(nowPos.x);
                    camera.setPosition(nowPos);
                }
            )
        );
    }

    var set3DButton = function(){
        var manager = new BABYLON.GUI.GUI3DManager(scene);

        var panel = new BABYLON.GUI.SpherePanel();
        panel.margin = 60;

        manager.addControl(panel);
        anchor.rotation = new BABYLON.Vector3(0,1.95, 0);
        // console.log(anchor);
        panel.linkToTransformNode(anchor);
        panel.position.z = -1.5;
        panel.position.x = 0;
        panel.position.y+=100;
        panel.radius = 200;

        // console.log(panel);

        // Let's add some buttons!

        buttonText = ["設定個人頁面\n1","追隨此用戶\n2","我的追隨\n3","我的商品\n4","購買配件\n5","換裝\n6"];

        var addButton = function(index) {
            var button = new BABYLON.GUI.HolographicButton("orientation");
            panel.addControl(button);
            button.scaling.x=75;
            button.scaling.y=50;
            button.scaling.z=50;
            //console.log(button);
            //button.text = text;
            var text1 = new BABYLON.GUI.TextBlock();
            
            text1.fontstyle = 'bold'
            text1.fontFamily = "Verdana";
            text1.textVerticalAlignment = BABYLON.GUI.Control.VERTICAL_ALIGNMENT_CENTER
            text1.width = 3;
            text1.text = buttonText[index];
            text1.color = "White";
            text1.fontSize = 40;
            button.content = text1;
            //button.isVisible = false;

            button.pointerEnterAnimation = () => {
                button.scaling.x=150;
                button.scaling.y=100;
                button.scaling.z=100;


            }
            button.pointerOutAnimation = () => {

                button.scaling.x=75;
                button.scaling.y=50;
                button.scaling.z=50;    
            }
            button.pointerDownAnimation = function() {
                
                if(index == 4){
                    window.location.pathname = '/../shop.php';
                }
                if(index == 5){
                    // 換裝
                    for(var i=0;i<6;i++){
                        backButton[i].isVisible = false;
                    }
                    scene.registerBeforeRender(dressUpAnimation);
                }
                if(index == 3){
                    console.log(globalMesh['body']);
                }
                
            }
            return button
        }

        panel.blockLayout = true;
        
        for (var index = 0; index < 6; index++) {
            backButton[index] = addButton(index);    
        }
        panel.blockLayout = false;
    }

    var wearCloth = function(id){
        console.log("wear ",id);
        var cate = productCate[id],Cate;
        if(cate == "2") cate = "suit",Cate = "Suit";
        else if(cate == "3") cate = "shoe",Cate = "Shoe";
        else if(cate == "1") cate = "hair",Cate = "Hair";
        console.log("cate = "+cate+" "+Cate);
        console.log("globalMesh = ",globalMesh[cate]);
        for(var i=0;i<globalMesh[cate].length;i++){
            globalMesh[cate][i].dispose();
        }
        loadMesh(scene,modelPath+genderS+Cate+id.toString(10)+"/",genderS+Cate+id.toString(10)+".obj",0,-2.3+30,0,cate);

    }

    var scene = new BABYLON.Scene(engine);

    var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20, 20, 100), scene);

    var anchor = new BABYLON.TransformNode("");

    setTime(scene);
    
    var camera = new BABYLON.ArcRotateCamera("Camera", 0,0,20, BABYLON.Vector3(0,0,0), scene);

    camera.setTarget(new BABYLON.Vector3(0,100,0));
    camera.setPosition(new BABYLON.Vector3(0,230,330));
    //camera.attachControl(canvas, true);

    var body,suit,hair,shoe ;

    if(userGender == 0) genderS = "man";
    else genderS = "woman";

    var modelPath = "model/228allModel/";

    body = loadMesh(scene,modelPath+genderS+"Body/",genderS+"Body.obj",0,30,0,'body');
    suit = loadMesh(scene,modelPath+genderS+"Suit"+suitID.toString(10)+"/",genderS+"Suit"+suitID.toString(10)+".obj",0,-2.3+30,0,'suit');
    hair = loadMesh(scene,modelPath+genderS+"Hair"+hairID.toString(10)+"/",genderS+"Hair"+hairID.toString(10)+".obj",0,-1.8+30,0,'hair');
    shoe = loadMesh(scene,modelPath+genderS+"Shoe"+shoeID.toString(10)+"/",genderS+"Shoe"+shoeID.toString(10)+".obj",0,-1.8+30,0,'shoe');

    var rock = BABYLON.SceneLoader.ImportMesh("","model/228allModel/ROCK2/","ROCK2.obj",scene,function(newMeshes){
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].position = new BABYLON.Vector3(0,0,20);
            newMeshes[i].material.diffuseColor = new BABYLON.Color3(1,1,1);
            //newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
        }
    });

    doActionManager(scene);

    // Move the light with the camera
    scene.registerBeforeRender(function () {
        light.position = camera.position;
    });


    
    set3DButton(scene);

    

    //console.log(camera);


    var grassMaterial = new BABYLON.StandardMaterial(name + "bawl", scene);
    var grassTexture = new BABYLON.GrassProceduralTexture(name + "textbawl", 1024, scene);
    grassMaterial.ambientTexture = grassTexture;
    var nowColor = grassMaterial.diffuseColor;
    grassMaterial.diffuseColor = new BABYLON.Color3(nowColor.r*8,nowColor.g*8,nowColor.b*8);

    /*groundMaterial = new BABYLON.StandardMaterial("ground", scene);
    groundMaterial.reflectionTexture = new BABYLON.MirrorTexture("mirror", 1024, scene, true);
    groundMaterial.reflectionTexture.mirrorPlane = new BABYLON.Plane(0, -1.0, 0, 0);
    groundMaterial.reflectionTexture.level = 0.5;*/

    // Ground

    var roundGround = BABYLON.MeshBuilder.CreateDisc("disc", {radius: 500, arc: Math.PI, tessellation: 1000, sideOrientation: BABYLON.Mesh.DOUBLESIDE}, scene);
    roundGround.material = grassMaterial;
    //roundGround.rotation = BABYLON.Vector3(0,1.7,0);
    roundGround.rotation.x = Math.PI/2;
    console.log("ground",roundGround);

    //var ground = BABYLON.Mesh.CreateGround("ground", 2000, 2000, 1, scene, false);

    //groundMaterial.diffuseColor = new BABYLON.Color3(1.0, 1.0, 1.0);
    //groundMaterial.specularColor = new BABYLON.Color3(0, 0, 0);

    //ground.material = grassMaterial;

    // var advancedTexture = BABYLON.GUI.AdvancedDynamicTexture.CreateFullscreenUI("UI");

    var menuPlane = BABYLON.MeshBuilder.CreatePlane("menuPlane",{width:1000, height:500},scene);
    menuPlane.position = new BABYLON.Vector3(0,230,1000);
    menuPlane.rotate(BABYLON.Axis.Y,Math.PI,BABYLON.Space.LOCAL);
    console.log(menuPlane);

    var advancedTexture = BABYLON.GUI.AdvancedDynamicTexture.CreateForMesh(menuPlane);

    var menuRec = new BABYLON.GUI.Rectangle();
    
    menuRec.height = 900 + 'px';
    menuRec.width =  900 + 'px';
    //menuRec.scaleY =
    menuRec.cornerRadius = 20;
    menuRec.background = "white";
    menuRec.alpha = 1;
    menuRec.color = "#666666";
    menuRec.thickness = 2;
    menuRec.zIndex = 0;
    
    advancedTexture.addControl(menuRec);

    var createRectangle = function() {
        var rect1 = new BABYLON.GUI.Rectangle();
        rect1.width = 0.2;
        rect1.height = "40px";
        rect1.cornerRadius = 20;
        rect1.color = "Orange";
        rect1.thickness = 0;
        rect1.background = "green";
        advancedTexture.addControl(rect1);    
        return rect1;
    }

    var menuRecImg = new BABYLON.GUI.Image("menuRecImg","images/dressUp/bg2.png");
    menuRecImg.zIndex = 2;
    menuRec.addControl(menuRecImg);

    var cate = []
    for(var i=1;i<=5;i++){
        cate[i] = BABYLON.GUI.Button.CreateImageOnlyButton("cate" + i.toString(10), "images/dressUp/cate" + i.toString(10) + ".png");
        
        cate[i].left = i*100-466;
        cate[i].top = -325;
        cate[i].width = 0.1;
        cate[i].zIndex = 1;
        cate[i].thickness = 0;
        cate[i].height = 0.08;
        if(i==1) cate[i].top = -323;
        cate[i].id = i;
        //cate[i].AllowAlphaInheritance = true;
        cate[i].pointerDownAnimation = function(){
            for(var i=1;i<=5;i++){
                advancedTexture.removeControl(cate[i]); 
                if(i==this.id){
                    cate[i].top = -323;
                    cate[i].zIndex = 3;
                }
                else{
                    cate[i].top = -325;
                    cate[i].zIndex = 1;
                }
                console.log('cate ',i," = ",cate[i]);
                
                advancedTexture.addControl(cate[i]); 
                advancedTexture.removeControl(menuRec);
                advancedTexture.addControl(menuRec);
            }
            this.scaleX = this.scaleY = 1;
        }
        advancedTexture.addControl(cate[i]); 
    }


    

    var closeButton = BABYLON.GUI.Button.CreateImageOnlyButton("cate" + i.toString(10), "images/dressUp/closeButton.png");

    closeButton.left = 410;
    closeButton.top = -380;
    closeButton.zIndex = 3;
    closeButton.thickness = 0;
    closeButton.width = 0.035;
    closeButton.height = 0.06;
    closeButton.pointerDownAnimation = function(){
        scene.registerBeforeRender(closeMenuAnimation);
    };
    advancedTexture.addControl(closeButton);

    productID = [];

    for(var i=1;i<=5;i++) {
        productID[i] = [];
        for(var j=0;j<10;j++){
            productID[i][j] = j+1;
        }
        
    }
    
    var nowCate = 2;

    var blocks = []
    var blockImg = []
    for(var i=0;i<2;i++){
        for(var j=0;j<5;j++){
            var id = i*5+j;
            blocks[id] = BABYLON.GUI.Button.CreateImageOnlyButton("cate" + i.toString(10), "images/dressUp/block.png");

            blocks[id].left = -320 + j*160;
            blocks[id].top = -50 + i*250;
            blocks[id].zIndex = 3;
            blocks[id].thickness = 0;
            blocks[id].width = 0.12;
            blocks[id].height = 0.18;
            advancedTexture.addControl(blocks[id]);

            
            blockImg[id] = BABYLON.GUI.Button.CreateImageOnlyButton("block" + id.toString(10),"images/product/product" + (productID[nowCate][id]).toString(10) + ".png");
            blockImg[id].left = -320 + j*160;
            blockImg[id].top = -50 + i*250;
            blockImg[id].zIndex = 4;
            blockImg[id].thickness = 0;
            blockImg[id].width = 0.12;
            blockImg[id].height = 0.18;
            blockImg[id].id = productID[nowCate][id];
            console.log("block ",id," = ",blockImg[id]);
            

            blockImg[id].pointerDownAnimation = function(){
                console.log('click ',this.id);
                wearCloth(this.id);
            }
            advancedTexture.addControl(blockImg[id]);

            
        }
    }

    var lastPage = BABYLON.GUI.Button.CreateImageOnlyButton("lastPage", "images/dressUp/leftTriangle.png");
    var nextPage = BABYLON.GUI.Button.CreateImageOnlyButton("nextPage", "images/dressUp/rightTriangle.png");

    lastPage.left = -400;
    lastPage.top = 80;
    lastPage.zIndex = 3;
    lastPage.thickness = 0;
    lastPage.width = 0.015;
    lastPage.height = 0.06;
    lastPage.pointerDownAnimation = function(){
        console.log("lastPage!");
    };
    advancedTexture.addControl(lastPage);

    nextPage.left = 400;
    nextPage.top = 80;
    nextPage.zIndex = 3;
    nextPage.thickness = 0;
    nextPage.width = 0.015;
    nextPage.height = 0.06;
    nextPage.pointerDownAnimation = function(){
        console.log("nextPage!");
    };
    advancedTexture.addControl(nextPage);


    //menuPlane.lootAt(camera.position);

    
    // var panel = new BABYLON.GUI.PlanePanel();
    // panelMenu.margin = 0.02;
    // panelMenu.position.x = 0;
    // panelMenu.position.y = 230;
    // panelMenu.position.z = 1010;
    // var menuPanel = new BABYLON.GUI.StackPanel();
    // menuPanel.height = 900+ 'px';
    // menuPanel.width = 900 + 'px';
    // menuPanel.panelVerticalAlignment = BABYLON.GUI.Control.VERTICAL_ALIGNMENT_TOP;
    // menuRec.addControl(menuPanel);

    // var topMenuPanel = new BABYLON.GUI.StackPanel();
    // topMenuPanel.width = 900 + 'px';
    // topMenuPanel.height = (900 * 0.15) + 'px';
    // topMenuPanel.panelVerticalAlignment = BABYLON.GUI.Control.HORIZONTAL_ALIGNMENT_RIGHT;
    // menuPanel.addControl(topMenuPanel);

    // var cateMenuPanel = new BABYLON.GUI.StackPanel();

    // cateMenuPanel.width = 900 + 'px';
    // cateMenuPanel.height = (900*0.15) + 'px';

    // for(var i = 1 ; i<=4;i++){

    // }

    //var cateMenuPanel = new B

    // var bodyMenuPanel = new BABYLON.GUI.StackPanel();
    // bodyMenuPanel.width = 900 + 'px';
    // bodyMenuPanel.height = (900 * 0.7) + 'px';
    // topMenuPanel.panelVerticalAlignment = BABYLON.GUI.Control.HORIZONTAL_ALIGNMENT_LEFT;
    // menuPanel.addControl(bodyMenuPanel);


    // var overMenuPanel = new BABYLON.GUI.StackPanel();
    // overMenuPanel.isVertical = false;
    // overMenuPanel.height = 900+ 'px';
    // overMenuPanel.width = 900 + 'px';
    
    //menuPanel.addControl(overMenuPanel);

    // topMenuPanel.clipChildren = false;
    // topMenuPanel.isVertical = false;
    // topMenuPanel.adaptWidthToChildren = false;
    // topMenuPanel.adaptHeightToChildren = false;

    // var closeButton = new BABYLON.GUI.Button.CreateSimpleButton("buttonClose","x");
    //var closeButton = new BABYLON.GUI.Button.CreateImageButton("buttonClose","x","images/dressUp/xDark.png");
    // closeButton.color = "white";
    // closeButton.background = "black";
    //closeButton.image = new Image();
    
    // closeButton.verticalAlignment = BABYLON.GUI.Control.VERTICAL_ALIGNMENT_TOP;
    // closeButton.horizontalAlignment = BABYLON.GUI.Control.HORIZONTAL_ALIGNMENT_RIGHT;
    // closeButton.fontSize = 30;
    // closeButton.fontFamily = "Arial";
    // closeButton.width = (50) + 'px';
    // closeButton.height = (900 * 0.14) + 'px';
    // closeButton.cornerRadius = 0;
    // closeButton.paddingLeft = "30px"

    // closeButton.thickness = 0;
    // closeButton.image.width = 1;
    // closeButton.image.height = 1;
    // closeButton.image.stretch = BABYLON.GUI.Image.STRETCH_UNIFORM;
    // closeButton.image.autoScale = true;
    // closeButton.image.height = "100%";
    // closeButton.image.stretch= BABYLON.GUI.Image.STRETCH_UNIFORM;
    // closeButton.pointerDownAnimation = function(){
    //     scene.registerBeforeRender(closeMenuAnimation);
    // }

    // console.log("closeBUt = ",closeButton)
    // console.log("topPanel = ",topMenuPanel);
    // topMenuPanel.addControl(closeButton);

    



    /*var closeButton2 = new BABYLON.GUI.Button.CreateImageButton("buttonClose2","Close","../images/logo.jpg");
    // closeButton.color = "white";
    // closeButton.background = "black";
    //closeButton.image = new Image();
    closeButton2.fontSize = 15;
    closeButton2.fontFamily = "Arial";
    closeButton2.left = 129.5 + 'px';
    closeButton2.top = 0 + 'px';
    closeButton2.width = 150 + 'px';
    closeButton2.height = 900 * 0.15 + 'px';
    closeButton2.cornerRadius = 0;
    closeButton2.image.width = "100%";
    // closeButton2.verticalAlignment = BABYLON.GUI.Control.VERTICAL_ALIGNMENT_TOP;
    // closeButton2.horizontalAlignment = BABYLON.GUI.Control.HORIZONTAL_ALIGNMENT_CENTER;
    
    // closeButton.image.height = "100%";
    // closeButton.image.stretch= BABYLON.GUI.Image.STRETCH_UNIFORM;
    closeButton2.pointerDownAnimation = function(){
        scene.registerBeforeRender(closeMenuAnimation);
    }
    
    // closeButton2.moveToVector3(new BABYLON.Vector3(550,129.5,1501));
    topMenuPanel.addControl(closeButton2);
    closeButton2.left = 129.5 + 'px';
    closeButton2.top = 0 + 'px';
    // closeButton2.moveToVector3(new BABYLON.Vector3(550,129.5,1501));
    console.log("closeBUt2 = ",closeButton2)*/
    

    // var addCloseBut = function(){
        
    //     var closeButton = new BABYLON.GUI.HolographicButton("orientation");//new BABYLON.GUI.Button3D("orientation");
    //     panelMenu.addControl(closeButton);
    //     //closeButton.imageUrl = "/images/logo.jpg";
    //     closeButton.scaling = new BABYLON.Vector3(300,200,200);
    //     closeButton.onPointerUpObservable.add(function(){
    //         panelMenu.isVertical = !panelMenu.isVertical;
    //         console.log("hi");
    //     });  

    //     text1.fontstyle = 'bold'
    //     text1.fontFamily = "Verdana";
    //     text1.textVerticalAlignment = BABYLON.GUI.Control.VERTICAL_ALIGNMENT_CENTER
    //     text1.width = 3;
    //     text1.text = "幹，看到沒?";
    //     text1.color = "Black";
    //     text1.fontSize = 60;
    //     closeButton.content = text1;



    // }
    

    
    



    return scene;
}  
var engine = new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true });
var scene = createScene();
engine.loadingUIText = "Loading!...";
engine.displayLoadingUI();

scene.executeWhenReady(function(){
    engine.hideLoadingUI();

    //scene.registerBeforeRender(dressUpAnimation);

    engine.runRenderLoop(function () {
        if (scene) {
            scene.render();
        }
    });
});



// Resize
window.addEventListener("resize", function () {
    engine.resize();
});

// camera.setTarget(new BABYLON.Vector3(0,100,0));
// camera.setPosition(new BABYLON.Vector3(0,230,330));
var zPosSpeed = 80;
var yTarSpeed = 26;

function dressUpAnimation(){
    var scene = engine.scenes[0];
    var camera = scene.activeCamera;
    if(camera.position.z < 1500){
        //camera.setPosition(new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z+zPosSpeed));
        //camera.position.z += zPosSpeed;
        var newPos = new BABYLON.Vector3(0,230,camera.position.z);
        newPos.z += zPosSpeed;
        camera.setPosition(newPos);
    }
    if(camera.target.y < 230) camera.target.y += yTarSpeed;
    var camPos = (camera.position.x).toString(10) + "," + (camera.position.y).toString(10) + "," + (camera.position.z).toString(10);
    var tarPos = (camera.target.x).toString(10) + "," + (camera.target.y).toString(10) + "," + (camera.target.z).toString(10);
    console.log( camPos + " to " + tarPos)
    //else console.log('now y = ',camera.target.y);
    if(camera.position.z >= 1500 && camera.target.y>=230){
        scene.unregisterBeforeRender(dressUpAnimation)
    }
}

function closeMenuAnimation(){
    var scene = engine.scenes[0];
    var camera = scene.activeCamera;
    if(camera.position.z > 331){
        var newPos = new BABYLON.Vector3(0,230,camera.position.z);
        newPos.z -= zPosSpeed;
        camera.setPosition(newPos);
    }
    if(camera.target.y > 100) camera.target.y -= yTarSpeed;
    var camPos = (camera.position.x).toString(10) + "," + (camera.position.y).toString(10) + "," + (camera.position.z).toString(10);
    var tarPos = (camera.target.x).toString(10) + "," + (camera.target.y).toString(10) + "," + (camera.target.z).toString(10);
    console.log( camPos + " to " + tarPos)
    //else console.log('now y = ',camera.target.y);
    if(camera.position.z <= 331 && camera.target.y<=100){
        for(var i=0;i<6;i++){
            backButton[i].isVisible = true;
        }
        camera.setPosition(new BABYLON.Vector3(0,230,330));
        camera.setTarget(new BABYLON.Vector3(0,100,0));
        scene.unregisterBeforeRender(closeMenuAnimation)
    }
}