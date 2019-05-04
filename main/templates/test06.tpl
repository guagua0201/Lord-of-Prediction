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
        <script src="https://preview.babylonjs.com/Ammo.js"></script>
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
        <!-- <script src = "https://github.com/kripken/ammo.js/blob/master/builds/ammo.js"></script>-->
        <!-- <script src = "javascripts/ammo.js"><script>-->
        <!-- <script src = "https://cdn.babylonjs.com/cannon.js" ></script>-->
        
        <style>
            html, body {
                overflow: auto;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #renderCanvas {
                width: 80%;
                height: 80%;
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: auto;
                touch-action: none;
                text-align: center;
            }
        </style>
    </head>
<body>
    <canvas id="renderCanvas"></canvas>
    
    <!-- <script src="javascripts/testUI.js"></script>-->
    <script src = "javascripts/testPhysics.js"></script>
</body>
	</div>
{/block}