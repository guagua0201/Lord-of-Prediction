{extends file='route.tpl'}
{block name='body'}
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
{/block}