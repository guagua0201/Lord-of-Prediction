var engine,scene;
console.log('hi');
var canvas = document.getElementById("renderCanvas");
var globalMesh = []
var backButton = []

var createScene = async function(){
	console.log('createScene');
	var scene = new BABYLON.Scene(engine);

	var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20,20,100),scene);

	setTime(scene);

	var camera = new BABYLON.ArcRotateCamera("Camera", 0,0,20, BABYLON.Vector3(0,0,0), scene);

    camera.setTarget(new BABYLON.Vector3(0,100,0));
    camera.setPosition(new BABYLON.Vector3(0,230,330));

    var rock = BABYLON.SceneLoader.ImportMesh("","model/ROCK2/","ROCK2.obj",scene,function(newMeshes){
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].position = new BABYLON.Vector3(0,0,20);
            newMeshes[i].material.diffuseColor = new BABYLON.Color3(1,1,1);
            //newMeshes[i].rotation = new BABYLON.Vector3(0,Math.PI,0);
        }
    });

    doActionManager(scene,camera);

    scene.registerBeforeRender(function () {
        light.position = camera.position;
    });

    set3DButtonSelf(scene);

    var grassMaterial = new BABYLON.StandardMaterial(name + "bawl", scene);
    var grassTexture = new BABYLON.GrassProceduralTexture(name + "textbawl", 1024, scene);
    grassMaterial.ambientTexture = grassTexture;
    var nowColor = grassMaterial.diffuseColor;
    grassMaterial.diffuseColor = new BABYLON.Color3(nowColor.r*8,nowColor.g*8,nowColor.b*8);
    var roundGround = BABYLON.MeshBuilder.CreateDisc("disc", {radius: 500, arc: Math.PI, tessellation: 1000, sideOrientation: BABYLON.Mesh.DOUBLESIDE}, scene);
    roundGround.material = grassMaterial;
    roundGround.rotation.x = Math.PI/2;

    set3DButtonSelf(scene);

    await getSelf(scene);

    await makeDressUpPlane(scene);



	return scene;
}

var newScene = async function(){
	engine = await new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true });
	scene = await createScene();

	scene.executeWhenReady(function(){
		engine.runRenderLoop(function() {
			if(scene){
				scene.render();
			}
		})
	});	

	window.addEventListener("resize",function(){
		engine.resize();
	});
}

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
function closeDressUpAnimation(){
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


var makeDressUpPlane = async function(){
	var menuPlane = BABYLON.MeshBuilder.CreatePlane("menuPlane",{width:1000, height:500},scene);
    menuPlane.position = new BABYLON.Vector3(0,230,1000);
    menuPlane.rotate(BABYLON.Axis.Y,Math.PI,BABYLON.Space.LOCAL);

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


    var nowCate = -1;

    doIdList(ownAcc,cate);

    var blocks = []
    var blockImg = []
    for(var i=0;i<2;i++){
        for(var j=0;j<5;j++){
            var id = i*5+j;
            if(id >= (sizeOfIdList)){

            }
            else{

            }
            /*
            blocks[id] = BABYLON.GUI.Button.CreateImageOnlyButton("cate" + i.toString(10), "images/dressUp/block.png");

            blocks[id].left = -320 + j*160;
            blocks[id].top = -50 + i*250;
            blocks[id].zIndex = 3;
            blocks[id].thickness = 0;
            blocks[id].width = 0.12;
            blocks[id].height = 0.18;
            advancedTexture.addControl(blocks[id]);

            nowProduct = getProduct(id);
            blockImg[id] = BABYLON.GUI.Button.CreateImageOnlyButton("block" + id.toString(10),"images/product/" + (productID[nowCate][id]).toString(10) + ".png");
            blockImg[id].left = -320 + j*160;
            blockImg[id].top = -50 + i*250;
            blockImg[id].zIndex = 4;
            blockImg[id].thickness = 0;
            blockImg[id].width = 0.12;
            blockImg[id].height = 0.18;
            blockImg[id].id = productID[nowCate][id];
            

            blockImg[id].pointerDownAnimation = function(){
                console.log('click ',this.id);
                wearCloth(this.id);
            }

            advancedTexture.addControl(blockImg[id]);*/

            
        }
    }




    /*var cate = []
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
                //console.log('cate ',i," = ",cate[i]);
                
                advancedTexture.addControl(cate[i]); 
                advancedTexture.removeControl(menuRec);
                advancedTexture.addControl(menuRec);
            }
            this.scaleX = this.scaleY = 1;
        }
        advancedTexture.addControl(cate[i]); 
    }


    

    

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

            nowProduct = getProduct(id);
            blockImg[id] = BABYLON.GUI.Button.CreateImageOnlyButton("block" + id.toString(10),"images/product/" + (productID[nowCate][id]).toString(10) + ".png");
            blockImg[id].left = -320 + j*160;
            blockImg[id].top = -50 + i*250;
            blockImg[id].zIndex = 4;
            blockImg[id].thickness = 0;
            blockImg[id].width = 0.12;
            blockImg[id].height = 0.18;
            blockImg[id].id = productID[nowCate][id];
            

            blockImg[id].pointerDownAnimation = function(){
                console.log('click ',this.id);
                wearCloth(this.id);
            }
            advancedTexture.addControl(blockImg[id]);

            
        }
    }

    	 */
}

set3DButtonSelf = async function(scene){
        var manager = new BABYLON.GUI.GUI3DManager(scene);
        var anchor = new BABYLON.TransformNode("");
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
                    console.log('here');
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


newScene();

