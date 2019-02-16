var canvas = document.getElementById("renderCanvas");




var createScene = function () {
    var scene = new BABYLON.Scene(engine);

    //Adding a light
    var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20, 20, 100), scene);

    var anchor = new BABYLON.TransformNode("");

    

    //Adding an Arc Rotate Camera
    var camera = new BABYLON.ArcRotateCamera("Camera", 0,0,20, BABYLON.Vector3(0,0,0), scene);
    //camera.attachControl(canvas, true);

    // load mesh 
    // man -> hair -> shirt -> pants -> shoe 

    
    camera.setTarget(new BABYLON.Vector3(0,100,0));
    camera.setPosition(new BABYLON.Vector3(0,190,-330));


    var man = BABYLON.SceneLoader.ImportMesh("", "model/allModel/womanbra/", "womanBra.obj", scene, function (newMeshes){
        
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
        }
        
    });

    var hair = BABYLON.SceneLoader.ImportMesh("","model/allModel/womanhair/","womanhair.obj",scene,function (newMeshes) {
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,-10,0.5);
        }
    });


    var shirt = BABYLON.SceneLoader.ImportMesh("","model/allModel/womantshirt/","qwe.obj",scene,function (newMeshes) {
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,-2,-1);
        }
    });

    var pants = BABYLON.SceneLoader.ImportMesh("","model/allModel/womanpants/","shortpants.obj",scene,function (newMeshes) {
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,0,-1);
        }
    });

    var shoe = BABYLON.SceneLoader.ImportMesh("","model/allModel/womanshoe/","shoes.obj",scene,function(newMeshes){
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,-2,0);
        }
    });

    /*var pants2 = BABYLON.SceneLoader.ImportMesh("","model/allModel/womanpants2/","womanpants2.obj",scene,function (newMeshes) {
        
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,-5,0);
        }
    });
    console.log(pants2);*/

    /*var dress = BABYLON.SceneLoader.ImportMesh("","model/allModel/womandress/","blackdress.obj",scene,function (newMeshes) {

        //var myMaterial = new BABYLON.StandardMaterial("myMaterial", scene);

        //myMaterial.diffuseColor = new BABYLON.Color3(0.5, 0.3, 0.2);
        

        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
            newMeshes[i].position = new BABYLON.Vector3(0,-10,0);
        }
    });*/






    scene.actionManager = new BABYLON.ActionManager(scene);

    scene.actionManager.registerAction(
    new BABYLON.ExecuteCodeAction(
            {
                trigger: BABYLON.ActionManager.OnKeyDownTrigger,
                parameter: 37
            },
            function () { 
                
                var nowPos = new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z);
                if(nowPos.x>-200) nowPos.x-=20;
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
                if(nowPos.x<200) nowPos.x+=20;
                //console.log(nowPos.x);
                camera.setPosition(nowPos);
            }
        )
    );

    // Move the light with the camera
    scene.registerBeforeRender(function () {
        light.position = camera.position;
    });

    var manager = new BABYLON.GUI.GUI3DManager(scene);

    var panel = new BABYLON.GUI.SpherePanel();
    panel.margin = 20;

    manager.addControl(panel);
    anchor.rotation = new BABYLON.Vector3(0,-1.2,0);
    console.log(anchor);
    panel.linkToTransformNode(anchor);
    panel.position.z = -1.5;
    panel.position.y+=100;
    panel.radius = 200;

    console.log(panel);

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

        button.pointerEnterAnimation = () => {
            button.scaling.x=150;
            button.scaling.y=100;
            button.scaling.z=100;


        }
        button.pointerOutAnimation = () => {
            //button.backMaterial.albedoColor = new BABYLON.Vector3(1,0,1);
            //console.log("out");

            button.scaling.x=75;
            button.scaling.y=50;
            button.scaling.z=50;    
        }
        button.pointerDownAnimation = function() {
            
            if(index == 5){
                // 換裝
                window.location.pathname = '/../dressUp.php';
            }
            
        }
        //console.log(button);
        
        //button.poterEnterAnimation
    }

    panel.blockLayout = true;
    for (var index = 0; index < 6; index++) {
        addButton(index);    
    }
    panel.blockLayout = false;

    //console.log(camera);

    groundMaterial = new BABYLON.StandardMaterial("ground", scene);
    groundMaterial.reflectionTexture = new BABYLON.MirrorTexture("mirror", 1024, scene, true);
    groundMaterial.reflectionTexture.mirrorPlane = new BABYLON.Plane(0, -1.0, 0, 0);
    groundMaterial.reflectionTexture.level = 0.5;

    // Ground
    var ground = BABYLON.Mesh.CreateGround("ground", 2000, 2000, 1, scene, false);

    groundMaterial.diffuseColor = new BABYLON.Color3(1.0, 1.0, 1.0);
    groundMaterial.specularColor = new BABYLON.Color3(0, 0, 0);

    ground.material = groundMaterial;

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
            }while(d < 10000);
        var marker = BABYLON.Mesh.CreateSphere('cmarker', 30, 10, scene);
        marker.position = pos;
        }
    return scene;
}  
var engine = new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true });
var scene = createScene();

engine.runRenderLoop(function () {
    
    if (scene) {
        scene.render();
    }
});

// Resize
window.addEventListener("resize", function () {
    engine.resize();
});