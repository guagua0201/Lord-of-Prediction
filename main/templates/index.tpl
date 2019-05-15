{extends file='route.tpl'}
{block name='plugin'}
	<link rel='stylesheet' type='text/css' href='stylesheets/index-style.css'></link>
{/block}
{block name='body'}
	<div class='container'>
		<div id='slider' class='carousel slide' data-ride='carousel'>
			<ul class='carousel-indicators'>
				<li data-target='#slider' data-slide-to='0' class='active'></li>
				<li data-target='#slider' data-slide-to='1'></li>
				<li data-target='#slider' data-slide-to='2'></li>
			</ul>

			<div class='carousel-inner'>
				<div class='carousel-item active'>
					<img src='images/test/la.jpg'>
				</div>
				<div class='carousel-item'>
					<img src='images/test/chicago.jpg'>
				</div>
				<div class='carousel-item'>
					<img src='images/test/ny.jpg'>
				</div>
			</div>

			<a class='carousel-control-prev' href='#slider' data-slide='prev'>
				<span class='carousel-control-prev-icon'></span>
			</a>
			<a class='carousel-control-next' href='#slider' data-slide='next'>
				<span class='carousel-control-next-icon'></span>
			</a>
		</div>
	</div>
{/block}
<!-- old
	<div style='height: 600px'>
		<h1>Welcome to Prophecy King!</h1>
		<p>hello {$member}</p>

		{if $log_status == 0}
			<a href='/register.php' class='btn btn-primary'>Register</a>
			<a href='/login.php' class='btn btn-primary'>Login</a>
		{else}
			<a href='/logout.php' class='btn btn-primary'>Logout</a>
		{/if}
		<a href='/backstage.php' class='btn btn-primary'>Backstage</a>
		{if $log_status != 0}
			<a href='/addArticle.php' class='btn btn-primary'>Add Article</a>
		{/if}
		<a href='/listArticle.php/?type=1' class='btn btn-primary'>List Article</a>
		<a href='/listArticle.php/?type=0' class='btn btn-primary'>List All Article</a>
	</div>
-->
