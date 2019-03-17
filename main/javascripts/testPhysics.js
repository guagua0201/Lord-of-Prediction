var globalMesh = [];
console.log('hi');
var createScene = function () {
	var scene = new BABYLON.Scene(engine);

	var camera = new BABYLON.ArcRotateCamera("Camera", 3 * Math.PI / 2, Math.PI / 4, 30, BABYLON.Vector3.Zero(), scene);

	camera.attachControl(canvas, true);

	var light = new BABYLON.DirectionalLight("dir02", new BABYLON.Vector3(0.2, -1, 0), scene);
    light.position = new BABYLON.Vector3(0, 80, 0);

    var light1 = new BABYLON.HemisphericLight("hemi", new BABYLON.Vector3(1, -1, 0), scene);

    var shadowGenerator = new BABYLON.ShadowGenerator(2048, light);

	var cover = new BABYLON.StandardMaterial("cover", scene);
    cover.diffuseTexture = new BABYLON.Texture("https://upload.wikimedia.org/wikipedia/commons/2/2a/VichyKaro.png");
    
    var blueMat = new BABYLON.StandardMaterial("crate", scene);
    blueMat.diffuseColor = BABYLON.Color3.Blue();

    var grassMaterial = new BABYLON.StandardMaterial(name + "bawl", scene);
    var grassTexture = new BABYLON.GrassProceduralTexture(name + "textbawl", 1024, scene);
    grassMaterial.ambientTexture = grassTexture;
    var nowColor = grassMaterial.diffuseColor;
    grassMaterial.diffuseColor = new BABYLON.Color3(nowColor.r*8,nowColor.g*8,nowColor.b*8);
    
    // var plane = BABYLON.MeshBuilder.CreateGround("plane", {width: 15, height: 15, subdivisions: 25 }, scene);
    // plane.position.y = 8;
    // plane.position.z = 2;
    // plane.material = cover;

    //shadowGenerator.addShadowCaster(plane);
    console.log('babylon = ',BABYLON)
    var gravityVector = new BABYLON.Vector3(0,-9.81, 0);
    var physicsPlugin = new BABYLON.CannonJSPlugin();
    scene.enablePhysics(gravityVector, physicsPlugin);

    // plane.physicsImpostor =  new BABYLON.PhysicsImpostor(plane, BABYLON.PhysicsImpostor.ClothImpostor, { mass: 1, friction: 0.1, restitution: 0, margin: 0.25, damping: 0.01}, scene);
    // plane.physicsImpostor.velocityIterations = 10; 
    // plane.physicsImpostor.positionIterations = 10;
    // plane.physicsImpostor.stiffness = 1;
    
	var ground = BABYLON.MeshBuilder.CreateBox("ground", {width: 800, depth: 800, height:1}, scene);
    ground.physicsImpostor = new BABYLON.PhysicsImpostor(ground, BABYLON.PhysicsImpostor.BoxImpostor, { mass: 0, friction: 0.5, restitution: 0.7 }, scene);
    ground.material = grassMaterial;

    ground.receiveShadows = true;

    // var box = BABYLON.MeshBuilder.CreateBox("box", {width: 5, depth: 8, height:4}, scene);
    // box.position.y = 2.5;
    // box.material = blueMat;
    // box.forceSharedVertices();
    // box.increaseVertices(10);

    // shadowGenerator.addShadowCaster(box);

    // box.receiveShadows = true;

    // box.physicsImpostor = new BABYLON.PhysicsImpostor(box, BABYLON.PhysicsImpostor.SoftbodyImpostor, { mass: 15, friction: 0.5, restitution: 0, margin: 0.15 }, scene);
    // box.physicsImpostor.pressure =  40000;
    // box.physicsImpostor.velocityIterations = 10; 
    // box.physicsImpostor.positionIterations = 10;
    // box.physicsImpostor.stiffness = 1;
    
    var cloth = BABYLON.SceneLoader.ImportMesh("","model/source/","fba1a669ae9347068ed339d3f4e4c5d3.obj",scene,function(newMeshes){
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].physicsImpostor =  new BABYLON.PhysicsImpostor(newMeshes[i],BABYLON.PhysicsImpostor.NoImpostor,{mass:1,friction: 0.1,restitution: 0,margin: 0.1, damping:0.01},scene);
            newMeshes[i].physicsImpostor.velocityIterations = 10; 
            newMeshes[i].physicsImpostor.positionIterations = 10;
            newMeshes[i].physicsImpostor.stiffness = 0.9;
        }
    });
   
    // var physicsRoot;
    
    // var cloth = BABYLON.SceneLoader.ImportMesh("","model/228allModel/manSuit4/","manSuit4.obj",scene,function(newMeshes){
    //     physicsRoot = new BABYLON.Mesh("physicsRoot", scene);
    //     physicsRoot.position.y+=100;
    //     newMeshes.forEach((m, i)=>{
    //         if(m.name.indexOf("box") != -1){
    //             m.isVisible = false
    //             physicsRoot.addChild(m)
    //         }
    //         physicsRoot.addChild(m)
    //     })
    //     newMeshes.forEach((m, i)=>{
    //         if(m.parent == null){
    //             physicsRoot.addChild(m)
    //         }
    //     })

    //     physicsRoot.getChildMeshes().forEach((m)=>{
    //         if(m.name.indexOf("box") != -1){
    //             m.scaling.x = Math.abs(m.scaling.x)
    //             m.scaling.y = Math.abs(m.scaling.y)
    //             m.scaling.z = Math.abs(m.scaling.z)
    //             m.physicsImpostor = new BABYLON.PhysicsImpostor(m, BABYLON.PhysicsImpostor.BoxImpostor, {mass:1,friction: 0,restitution: 0,margin: 0.1, damping:0.01}, scene);
    //         }
    //     })

    //     //physicsRoot.scaling.scaleInPlace(scaling);
    //     physicsRoot.physicsImpostor = new BABYLON.PhysicsImpostor(physicsRoot, BABYLON.PhysicsImpostor.NoImpostor, {mass:1,friction: 0,restitution: 0,margin: 0.1, damping:0.01}, scene);
    //     return newMeshes;
    // });

    
    

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

