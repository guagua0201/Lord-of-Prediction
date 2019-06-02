console.log('hi');
var canvas = document.getElementById("renderCanvas");

var createScene = async function(){
	console.log('createScene');
	var scene = new BABYLON.Scene(engine);

	var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20,20,100),scene);

	var anchor = new BABYLON.TransformNode("");

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



	return scene;
}

var newScene = async function(){
	var engine = await new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true });
	var scene = await createScene();

	await getSelf(scene);
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



function dressUpAnimation(){

}
function closeDressUpAnimation(){

}

newScene();