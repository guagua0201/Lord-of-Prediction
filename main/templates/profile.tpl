{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh; padding: 30px'>
		<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Babylon.js sample code</title>

        <!-- Babylon.js -->
        <script src="https://code.jquery.com/pep/0.4.2/pep.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.6.2/dat.gui.min.js"></script>
        <script src="https://preview.babylonjs.com/cannon.js"></script>
        <script src="https://preview.babylonjs.com/Oimo.js"></script>
        <script src="https://preview.babylonjs.com/earcut.min.js"></script>
        <script src="https://preview.babylonjs.com/babylon.js"></script>
        <script src="javascripts/objFileLoader.js"></script>
        <script src="https://preview.babylonjs.com/inspector/babylon.inspector.bundle.js"></script>
        <script src="https://preview.babylonjs.com/materialsLibrary/babylonjs.materials.min.js"></script>
        <script src="https://preview.babylonjs.com/proceduralTexturesLibrary/babylonjs.proceduralTextures.min.js"></script>
        <script src="https://preview.babylonjs.com/postProcessesLibrary/babylonjs.postProcess.min.js"></script>
        <script src="https://preview.babylonjs.com/loaders/babylonjs.loaders.js"></script>
        <script src="https://preview.babylonjs.com/serializers/babylonjs.serializers.min.js"></script>
        <script src="https://preview.babylonjs.com/gui/babylon.gui.min.js"></script>

        <style>
            html, body {
                overflow: hidden;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #renderCanvas {
                width: 100%;
                height: 100%;
                touch-action: none;
            }
        </style>
    </head>
<body>
    <canvas id="renderCanvas"></canvas>
    <script>

        var canvas = document.getElementById("renderCanvas");
        

        var createScene = function () {
            var scene = new BABYLON.Scene(engine);
        
            //Adding a light
            var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20, 20, 100), scene);
        
            //Adding an Arc Rotate Camera
            var camera = new BABYLON.ArcRotateCamera("Camera", 1, 1, 200, BABYLON.Vector3.Zero(), scene);
            camera.attachControl(canvas, false);
        
            // The first parameter can be used to specify which mesh to import. Here we import all meshes 
            /*var wall = BABYLON.SceneLoader.ImportMesh("", "model/wall/", "wall2.obj", scene, function (newMeshes){
                // Set the target of the camera to the first imported mesh
                newMeshes[0].rotation = new BABYLON.Vector3(0.2,4.5,-0.3);
                newMeshes[0].position = new BABYLON.Vector3(0,200,100);
                
            });*/
            /*var man = BABYLON.SceneLoader.ImportMesh("", "model/", "womanNoMtl.obj", scene, function (newMeshes){
                // Set the target of the camera to the first imported mesh
                //newMeshes[0].rotation = new BABYLON.Vector3(0.2,4.5,-0.3);
                //newMeshes[1].position = new BABYLON.Vector3(0,0,0); 
                
            });*/
            camera.setPosition(new BABYLON.Vector3(0,100,1000));
            var dress = BABYLON.SceneLoader.ImportMesh("","model/","dress.babylon",scene,function (newMeshes) {
                camera.target = newMeshes[0];
                newMeshes[0].position.y-=100;
                newMeshes[0].position.z-=100;
                newMeshes[0].position.x-=100;
            });

            //camera.setTarget(new BABYLON.Vector3(0, 200,100));
            //camera.setPosition(new BABYLON.Vector3(0,100,1000));

        
            // Move the light with the camera
            scene.registerBeforeRender(function () {
                light.position = camera.position;
            });
        
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
    </script>
</body>
	</div>
{/block}