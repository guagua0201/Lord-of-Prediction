<!DOCTYPE html>
<html>
	<head>
		<title>Hello</title>
		<link rel="stylesheet" href="/stylesheets/style.css">
		<link rel="icon" href="/images/favicon.ico">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!-- Babylon.js -->
		<script src="https://code.jquery.com/pep/0.4.2/pep.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.6.2/dat.gui.min.js"></script>
		<script src="https://preview.babylonjs.com/cannon.js"></script>
		<script src="https://preview.babylonjs.com/Oimo.js"></script>
		<script src="https://preview.babylonjs.com/earcut.min.js"></script>
		<script src="https://preview.babylonjs.com/babylon.js"></script>
		<script src="https://preview.babylonjs.com/inspector/babylon.inspector.bundle.js"></script>
		<script src="https://preview.babylonjs.com/materialsLibrary/babylonjs.materials.min.js"></script>
		<script src="https://preview.babylonjs.com/proceduralTexturesLibrary/babylonjs.proceduralTextures.min.js"></script>
		<script src="https://preview.babylonjs.com/postProcessesLibrary/babylonjs.postProcess.min.js"></script>
		<script src="https://preview.babylonjs.com/loaders/babylonjs.loaders.js"></script>
		<script src="https://preview.babylonjs.com/serializers/babylonjs.serializers.min.js"></script>
		<script src="https://preview.babylonjs.com/gui/babylon.gui.min.js"></script>
		<style>

		    #renderCanvas {
				background: #cccccc;
		        width: 100%;
		        height: 100%;
		        touch-action: none;
		    }
		</style>
    </head>
	<body>
		{include file='header.tpl'}
		<div class='jumborton' style='min-height: 68vh; padding: 30px'>
			<canvas id="renderCanvas"></canvas>
		    <script>
				// http://www.html5gamedevs.com/topic/6737-cant-get-babylon-files-to-load/
				var canvas = document.getElementById("renderCanvas");
				var engine = new BABYLON.Engine(canvas,true);

				var createScene = function () {
					var scene = new BABYLON.Scene(engine);

					//Adding a light
					var light = new BABYLON.DirectionalLight("DirectionalLight", new BABYLON.Vector3(0, -1, 0), scene);

					//Adding an Arc Rotate Camera
					var camera = new BABYLON.ArcRotateCamera("Camera", 0, 0.8, 100, BABYLON.Vector3.Zero(), scene);
					camera.attachControl(canvas, false);

					// The first parameter can be used to specify which mesh to import. Here we import all meshes
					BABYLON.SceneLoader.ImportMesh("", "model/woman/", "WOMAN.obj", scene, function (newMeshes) {
						// Set the target of the camera to the first imported mesh
						camera.target = newMeshes[0];
						camera.radius = 500;
					});

					// Move the light with the camera
					scene.registerBeforeRender(function () {
						light.position = camera.position;
					});

					return scene;
				}

				var scene = createScene();
				engine.runRenderLoop(function(){
					scene.render();
				});
		    </script>
		</div>
		{include file='footer.tpl'}
	</body>
</html>