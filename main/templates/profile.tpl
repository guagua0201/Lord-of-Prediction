{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh; padding: 30px'>
		<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
                overflow: auto;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #renderCanvas {
                width: 100%;
                height: 80%;
                margin: auto;
                touch-action: none;
                text-align: center;
            }
            canvas {
               display: inline;
            }
        </style>
    </head>
<body background="/images/background2.jpg">
    <canvas id="renderCanvas"></canvas>
    <script src="javascripts/follow.js"></script>
    <script src="profileReadFile.php?userGender={$gender}&member={$member}&userID={$userID}"></script>
    
    <script src="javascripts/profileLib.js"></script>

<!--    {if $isSelf eq 1}
        <script src = "javascripts/profile.js"></script>
    {else}
        <script src = "javascripts/profileOther.js"></script>
    {/if}  -->


    <script src="javascripts/newProfile.js"></script>
</body>
	</div>
{/block}