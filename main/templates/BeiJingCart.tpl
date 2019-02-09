{extends file='route.tpl'}
{block name='body'}
	<head>
		<script src="https://cdn.jsdelivr.net/npm/phaser@3.15.1/dist/phaser-arcade-physics.min.js"></script>
	</head>
	<!-- <div style='min-height: 68vh; padding: 30px'>
		<style>
			canvas{
				background: #ccc
			}
		</style>
		
		<canvas id="myCanvas" width="1200" height = "780">
			<script src="/javascripts/BeiJingCart.js"></script>
		</canvas>
	</div> -->

	<div style='min-height: 68vh; text-align: center' id='gameBlock' class='jumborton'>
		<script src="/javascripts/BeiJingCartPhaser.js"></script>
	</div>
{/block}