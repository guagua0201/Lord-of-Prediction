var engine,scene;
console.log('hi');
var canvas = document.getElementById("renderCanvas");
var globalMesh = []
var backButton = []

var productInform = []

var nowPage = 0;
var startAjax = 0;

var cateMenuOpen = 0;

var nowCate = 0;

var cateStr = [];

var blocks = [];

var blockImg = [];

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
    for(var i=0;i<6;i++){
        backButton[i].isVisible = false;
    }
	var scene = engine.scenes[0];
    var camera = scene.activeCamera;
    if(camera.position.z < 1700){
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
    if(camera.position.z >= 1700 && camera.target.y>=230){
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
        scene.unregisterBeforeRender(closeDressUpAnimation)
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

    var menuRecImg = new BABYLON.GUI.Image("menuRecImg","images/dressUp/bg2.png");
    menuRecImg.zIndex = 2;
    menuRec.addControl(menuRecImg);

    nowCate = 0;

    cateStr = []; // should ajax

    cateStr["0"] = "全部";
    cateStr["1"] = "頭髮";
    cateStr["2"] = "套裝";
    cateStr["3"] = "鞋子";
    cateStr["4"] = "眼部";
    cateStr["5"] = "武器";
    cateStr["6"] = "肩膀";
    cateStr["7"] = "手部";
    cateStr["8"] = "頸部";

    var chooseCateButton = BABYLON.GUI.Button.CreateImageWithCenterTextButton("chooseCateButton",cateStr[nowCate]+"         ","images/profile/category.png");
    console.log('choose button',chooseCateButton);
    chooseCateButton.left = -305;
    chooseCateButton.top = -335;
    chooseCateButton.zIndex = 3;
    chooseCateButton.thickness = 0;
    chooseCateButton.width = 0.15;
    chooseCateButton.height = 0.10;
    chooseCateButton.color = "cyan"
    chooseCateButton.fontSize=25;
    chooseCateButton.pointerUpAnimation = function(){
        makeCateList(advancedTexture,cateStr,chooseCateButton);
        console.log(chooseCateButton);
    };
    chooseCateButton.pointerDownAnimation = function(){

    };
    advancedTexture.addControl(chooseCateButton);

    makeBlock(advancedTexture);

    

    var closeButton = BABYLON.GUI.Button.CreateImageOnlyButton("closeButton", "images/dressUp/closeButton.png");

    closeButton.left = 410;
    closeButton.top = -380;
    closeButton.zIndex = 3;
    closeButton.thickness = 0;
    closeButton.width = 0.035;
    closeButton.height = 0.06;
    closeButton.pointerUpAnimation = function(){
        scene.registerBeforeRender(closeDressUpAnimation);
    };
    closeButton.pointerDownAnimation = function(){

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
    lastPage.pointerUpAnimation = async function(){
        console.log("lastPage!");
        
        if(nowPage > 0){
            await removeBlock(advancedTexture,blockImg);
            nowPage = nowPage - 1;
            await changeBlock(advancedTexture,blockImg);
        }
        //nowPage = await Math.max(0,nowPage-1);
        
    };
    lastPage.pointerDownAnimation = function(){

    };
    advancedTexture.addControl(lastPage);

    nextPage.left = 400;
    nextPage.top = 80;
    nextPage.zIndex = 3;
    nextPage.thickness = 0;
    nextPage.width = 0.015;
    nextPage.height = 0.06;
    nextPage.pointerUpAnimation = async function(){
        console.log("nextPage!");
        if(nowPage < Math.floor((sizeOfIdList-1)/10)){
            await removeBlock(advancedTexture,blockImg);
            nowPage = nowPage + 1;
            await changeBlock(advancedTexture,blockImg);
        }
        //nowPage = await Math.min(nowPage+1,Math.max(0,Math.floor((sizeOfIdList-1)/10)));
    };
    nextPage.pointerDownAnimation = function(){

    };
    advancedTexture.addControl(nextPage);

    



}

var makeBlock = async function(advancedTexture){
    nowPage = 0;

    await doIdList(ownAcc,nowCate);

    sizeOfIdList = idList.length;

    for(var i=0;i<blockImg.length;i++){
        advancedTexture.removeControl(blockImg[i]);
    }
    for(var i=0;i<blocks.length;i++){
        advancedTexture.removeControl(blocks[i]);
    }


    blocks = []
    blockImg = []

    for(var i=0;i<2;i++){
        for(var j=0;j<5;j++){
            id = i*5+j;

            blocks[id] = BABYLON.GUI.Button.CreateImageOnlyButton("cate" + i.toString(10), "images/dressUp/block.png");

            blocks[id].left = -320 + j*160;
            blocks[id].top = -50 + i*250;
            blocks[id].zIndex = 3;
            blocks[id].thickness = 0;
            blocks[id].width = 0.12;
            blocks[id].height = 0.18;
            advancedTexture.addControl(blocks[id]);

            pid = id + nowPage*10;
            
            console.log('id pid = ',id,pid);

            if(pid < sizeOfIdList){
                if(productInform[idList[pid]]){
                    nowProduct = productInform[idList[pid]];
                }
                else{
                    productInform[idList[pid]] = nowProduct = await getProduct(idList[pid]);
                    
                }
                
                console.log('all = ',id,pid,idList[pid],nowProduct,productFileStr(idList[pid],nowProduct[0],nowProduct[2]));
                blockImg[id] = BABYLON.GUI.Button.CreateImageOnlyButton("block" + id.toString(10),"images/product/" + productFileStr(idList[pid],nowProduct[0],nowProduct[2]) + ".png");
                blockImg[id].left = -320 + j*160;
                blockImg[id].top = -50 + i*250;
                blockImg[id].zIndex = 4;
                blockImg[id].thickness = 0;
                blockImg[id].width = 0.12;
                blockImg[id].height = 0.18;
                blockImg[id].id = idList[pid];
                

                blockImg[id].pointerUpAnimation = async function(){
                    console.log('click ',this.id);
                    await wearCloth(this.id);
                }
                blockImg[id].pointerDownAnimation = function(){

                };
                advancedTexture.addControl(blockImg[id]);
            }
            
        }
    }
}


var cateRec;

var cateButton = [];
var cateButtonKey = [0,0,0,0,0,0];

var makeCateList = function(advancedTexture,cateStr,chooseCateButton){
	if(cateMenuOpen == 0){
		cateRec = new BABYLON.GUI.Rectangle();
	    
	    cateRec.height = 650 + 'px';
	    cateRec.width =  250 + 'px';
	    //menuRec.scaleY =
	    cateRec.cornerRadius = 0;
	    cateRec.background = "white";
	    cateRec.alpha = 1;
	    cateRec.color = "#1B2E3C";
	    cateRec.thickness = 2;
	    cateRec.zIndex = 5;
	    cateRec.left = -285;
	    cateRec.top=42;
	    
	    advancedTexture.addControl(cateRec);

	    var cateRecImg = new BABYLON.GUI.Image("cateRecImg","images/profile/list.png");
	    cateRecImg.zIndex = 6;
	    cateRec.addControl(cateRecImg);

	    nowScroll = 0;

        var cateUp = new BABYLON.GUI.Button.CreateImageOnlyButton("cateUp","images/profile/triUp.png");
        cateUp.zIndex = 7;
        cateUp.thickness = 0;
        cateUp.height = 25 + 'px';
        cateUp.width = 40+'px';
        cateUp.top = -290;

        cateUp.pointerUpAnimation = function(){
            if(nowScroll > 0){
                nowScroll -- ;
            }     
            makeCateButton(cateRec,chooseCateButton,advancedTexture);
        }
        cateUp.pointerDownAnimation = function(){

        }
        //cateUp.height = cateUp.width = 500 + 'px';
        cateRec.addControl(cateUp);

        var cateDown = new BABYLON.GUI.Button.CreateImageOnlyButton("cateUp","images/profile/triDown.png");
        cateDown.zIndex = 7;
        cateDown.thickness = 0;
        cateDown.height = 25 + 'px';
        cateDown.width = 40+'px';
        cateDown.top = 290;

        cateDown.pointerUpAnimation = function(){
            if(nowScroll < cateStr.length - 1){
                nowScroll ++;
            }
            makeCateButton(cateRec,chooseCateButton,advancedTexture);
        }
        cateDown.pointerDownAnimation = function(){

        }

        cateRec.addControl(cateDown);
        for(var i=0;i<6;i++){
            cateButtonKey[i] = 0;
        }
        makeCateButton(cateRec,chooseCateButton,advancedTexture);
	}
	else{
		advancedTexture.removeControl(cateRec);
	}
	cateMenuOpen = 1-cateMenuOpen;
}

var makeCateButton = function(cateRec,chooseCateButton,advancedTexture){
    var cateButtonInterval = 93;

    for(var i = 0;i<6;i++){
        var nowCateId = i + nowScroll;
        if(cateButtonKey[i] == 1){
            cateRec.removeControl(cateButton[i]);
        }
        if(nowCateId < cateStr.length){

            cateButton[i] = new BABYLON.GUI.Button.CreateSimpleButton("cateButton" + i,cateStr[nowCateId]);
            cateButton[i].zIndex = 7;
            cateButton[i].thickness = 0;
            cateButton[i].width = 170 + 'px';
            cateButton[i].height = 70 + 'px';
            cateButton[i].top = -230 + cateButtonInterval * i;
            cateButton[i].color = '#65FFFF';
            cateButton[i].fontSize = 30;
            cateButton[i].cateId = nowCateId;
            cateButton[i].fontStyle = "normal";

            cateButton[i].pointerUpAnimation = function(){
                nowCate = this.cateId;
                console.log('hi cate ',nowCate);
                chooseCateButton.textBlock.text = cateStr[nowCate] +"         ";
                makeBlock(advancedTexture);
            }
            cateButton[i].pointerDownAnimation = function(){
            }

            cateRec.addControl(cateButton[i]);


            cateButtonKey[i] = 1;
        }
        else{
            cateButtonKey[i] = 0;
        }
    }
}


var removeBlock = function(advancedTexture,blockImg){
    for(var i=0;i<2;i++){
        for(var j=0;j<5;j++){
        	id = i*5+j;
            pid = id + nowPage*10;
            
            console.log('remove id pid = ',id,pid);

            if(pid < sizeOfIdList){
                advancedTexture.removeControl(blockImg[id]);
            }
            
        }
    }
}

var changeBlock = function(advancedTexture,blockImg){
    for(var i=0;i<2;i++){
        for(var j=0;j<5;j++){
        	id = i*5+j;
            pid = id + nowPage*10;
            
            console.log('change id pid = ',id,pid);

            if(pid < sizeOfIdList){
                if(productInform[idList[pid]]){
                    nowProduct = productInform[idList[pid]];
                }
                else{
                    productInform[idList[pid]] =nowProduct =  getProduct(idList[pid]);
                }
                
                console.log('all = ',id,pid,idList[pid],nowProduct,productFileStr(idList[pid],nowProduct[0],nowProduct[2]));
                blockImg[id] = BABYLON.GUI.Button.CreateImageOnlyButton("block" + id.toString(10),"images/product/" + productFileStr(idList[pid],nowProduct[0],nowProduct[2]) + ".png");
                blockImg[id].left = -320 + j*160;
                blockImg[id].top = -50 + i*250;
                blockImg[id].zIndex = 4;
                blockImg[id].thickness = 0;
                blockImg[id].width = 0.12;
                blockImg[id].height = 0.18;
                blockImg[id].id = idList[pid];
                

                blockImg[id].pointerUpAnimation = function(){
                    console.log('click ',this.id);
                    wearCloth(this.id);
                }
                blockImg[id].pointerDownAnimation = function(){

                };
                advancedTexture.addControl(blockImg[id]);
            }
            
        }
    }
}

var panel;

set3DButtonSelf = async function(scene){
    var manager = new BABYLON.GUI.GUI3DManager(scene);
    var anchor = new BABYLON.TransformNode("");
    panel = new BABYLON.GUI.SpherePanel();
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
        backButton[index] = new BABYLON.GUI.HolographicButton("orientation");
        panel.addControl(backButton[index]);
        backButton[index].scaling.x=75;
        backButton[index].scaling.y=50;
        backButton[index].scaling.z=50;
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
        backButton[index].content = text1;
        //button.isVisible = false;

        backButton[index].pointerEnterAnimation = () => {
            backButton[index].scaling.x=150;
            backButton[index].scaling.y=100;
            backButton[index].scaling.z=100;


        }
        backButton[index].pointerOutAnimation = () => {

            backButton[index].scaling.x=75;
            backButton[index].scaling.y=50;
            backButton[index].scaling.z=50;    
        }
        backButton[index].pointerUpAnimation = function() {
            
            if(index == 4){
                window.location.pathname = '/../shop.php';
            }
            if(index == 5){
                // 換裝
                for(var i=0;i<6;i++){
                    console.log('check button ',backButton[i]);
                    backButton[i].isVisible = false;
                    //panel.removeControl(backButton[i]);

                }
                for(var i=0;i<panel.length;i++){
                    panel.children[i].isVisible = false;
                    panel.children[i].mesh
                }
                console.log('here',panel);
                scene.registerBeforeRender(dressUpAnimation);
            }
            if(index == 3){
                console.log(globalMesh['body']);
            }
            
        }
        backButton[index].pointerDownAnimation = function(){

        };
        console.log("button",backButton[index]);
        return backButton[index]
    }

    panel.blockLayout = true;
    
    for (var index = 0; index < 6; index++) {
        addButton(index);    
    }
    panel.blockLayout = false;
}    

var delete3DButton = function(){
	for(var i=0;i<6;i++){

	}
}

var cateCheck = async function(id,cate){
    var nowProduct = await getProduct(id);
    

    console.log('check ',nowProduct,nowProduct[1],cate);
    if(cate === 0 || nowProduct[1].toString(10) == cate.toString(10)){
        console.log("return 1");
        return 1;
    }
    console.log('return 0');
    return 0;
}

var doIdList = async function(ownAcc,cate){
    //ownAcc = "11111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    idList = [];
    for(var i=0;i<200;i++){
        id = i;
        if(ownAcc[i] === "1"){
            var key = await cateCheck(id,nowCate);
            if(key === 1){
                console.log('push '+id);
                idList.push(id);
            }
            else{
                console.log('skip '+id);
            }
        }
    }
}

newScene();

