{extends file='route.tpl'}
{block name='plugin'}
	<link rel='stylesheet' type='text/css' href='stylesheets/index-style.css'></link>
{/block}
{block name='body'}

	<div class='container' width="1200" height="600 text-center">
		<video class='center' width = "1200" height = "600" controls muted autoplay>
			<source src="/images/movie.mp4" type="video/mp4">
			Your browser does not support video tag.
		</video>
	</div>
		
	<div class='container'>
		<div class='row'>
			<div class='col-md-6 col-sm-12'>
				<div class='jumbotron'>
					<h4>討論區</h4>	
					<ul>
						{foreach from=$articles item=article}
							<li>
								[<a href="searchArticle.php?category_id={$article['category_id']}">{$article['category_name']}</a>]&nbsp;&nbsp;
								<a href="showArticle.php?id={$article['id']}">{$article['title']}</a>&nbsp;
								<!-- <a href="userProfile.php?show=predict&user_id={$article['author']}">{$article['author_name']}</a>-->
							</li>
						{/foreach}
					</ul>
				</div>
			</div>

			<div class='col-md-6 col-sm-12'>
				<div class='jumbotron'>
					<h4>預測</h4>
					<ul> </ul>
				</div>
			</div>
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
