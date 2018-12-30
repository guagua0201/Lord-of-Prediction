{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh; padding: 30px'>
		<h2>後台管理頁面</h2>
		<nav class='navbar bg-light navbar-lg'>
			<ul class='navbar-nav'>
				<li class='nav-item'>
					<a href='listUser.php' class='nav-link'>用戶管理</a>
				</li>
				<li class='nav-item'>
					<a href='listArticle.php' class='nav-link'>文章管理</a>
				</li>
				<li class='nav-item'>
					<a href='listCatagory.php' class='nav-link'>分類管理</a>
				</li>
			</ul>
		</nav>
	</div>
{/block}