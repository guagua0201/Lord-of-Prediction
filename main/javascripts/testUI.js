var globalMesh = [];
console.log('hi');
var createScene = function () {
	var scene = new BABYLON.Scene(engine);

	var camera = new BABYLON.ArcRotateCamera("Camera", 3 * Math.PI / 2, Math.PI / 4, 30, BABYLON.Vector3.Zero(), scene);

	camera.attachControl(canvas, true);

	var light = new BABYLON.DirectionalLight("dir02", new BABYLON.Vector3(0.2, -1, 0), scene);
    light.position = new BABYLON.Vector3(0, 80, 0);

    //var light1 = new BABYLON.HemisphericLight("hemi", new BABYLON.Vector3(1, -1, 0), scene);
    scene.registerBeforeRender(function () {
        light.position = camera.position;
    });

    var advancedTexture = BABYLON.GUI.AdvancedDynamicTexture.CreateFullscreenUI("dressUp");

    var createRectangle = function() {
        var rect1 = new BABYLON.GUI.Rectangle();
        rect1.width = 0.2;
        rect1.height = "40px";
        rect1.cornerRadius = 20;
        rect1.color = "Orange";
        rect1.thickness = 4;
        rect1.background = "green";
        advancedTexture.addControl(rect1);    
        return rect1;
    }

    var now = [];
    for(var i=0;i<4;i++){
        now[i] = createRectangle()
        now[i].left = i*100;
        now[i].top = i*50;
    }



	return scene;
};

var canvas = document.getElementById("renderCanvas");

var engine = new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true });

var scene = createScene();

engine.runRenderLoop(function(){
    if(scene){
        scene.render();
    }
});

window.addEventListener("resize",function(){
    engine.resize();
});

