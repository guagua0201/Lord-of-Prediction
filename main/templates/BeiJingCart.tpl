{extends file='route.tpl'}
{block name='body'}
	<head>
		<script src="https://cdn.jsdelivr.net/npm/phaser@3.15.1/dist/phaser-arcade-physics.min.js"></script>
	</head>
	<div style='min-height: 68vh; padding: 30px'>
		<style>
			canvas{
				background: #ccc;
			}
			video{
				visibility: hidden;
			}
		</style>
		<script src="/php/BeiJingReadFile.php"></script>
		<canvas id="myCanvas" width="1200" height = "780">
			
		</canvas>
		<video id="video" src="./images/BeiJingCart/endVideo.mp4" controls="true" muted="muted"></video>

		<script src="/javascripts/BeiJingCart.js"></script>
	</div>
	<!-- <div style='min-height: 68vh; text-align: center' id='gameBlock' class='jumborton'>
		<script src="/javascripts/BeiJingCartPhaser2.js"></script>
	</div> -->
{/block}