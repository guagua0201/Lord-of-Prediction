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
    shoeID = 8;;
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

/*jQuery.ajax({
    type: "POST",
    url 'php/profileGet.php',
    dataType: 'json',
    data: {arguments: [member]},
})*/

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

        buttonText = ["X","追隨此用戶\n2","X","他的商品\n4","X","X"];

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
                
                if(index == 1){
                    follow(userA,userName);
                }
                if(index == 3){
                    window.location.pathname = '/../userProfile.php?user_id=' + userID;
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
