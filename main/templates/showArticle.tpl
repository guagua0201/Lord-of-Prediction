{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<h3>
			<a href="searchArticle.php?category={$row['id']}">{$category_name}</a>
			&nbsp;&gt;&gt;&nbsp;{$row['title']}
		</h3>
		<div class='row p-1 article_box'>
			<div class='col-md-2 p-4 rounded border' style='text-align: center'>
				<div>
					<strong>樓主</strong>
				</div>
				<div class='mt-4'>
					<img src='/images/userImages/{$author_image}.jpg' height='100' width='100' />
				</div>
				<div class='mt-4'>
					<a href="userProfile.php?id={$row['author']}">{$author_name}</a>
				</div>
				<div class='mt-4'>
					<button class='btn btn-outline-primary'>追蹤文章</button>
				</div>
				<div class='mt-4'>
					<button class='btn btn-outline-primary'>加為好友</button>
				</div>
			</div>
			<div class='col-md-10'>
				<div class='float-left' style='font-size: 0.8rem; color: gray'>
					發表時間：{$row['publish_time']}
					&nbsp;&nbsp;/&nbsp;&nbsp;
					上次修改時間：{$row['update_time']}
				</div>
				<div class='float-right'>
					[&nbsp;<a href='#'>引用留言</a>&nbsp;]
					[&nbsp;<a href='#'>檢舉</a>&nbsp;]
					[&nbsp;<a href='#'>到最新回文</a>&nbsp;]
				</div>
				<div class='mt-3 p-3' style='clear: both'>
					{$row['content']}
				</div>
			</div>
		</div>
		{foreach from=$comments item=comment name=loop}
			<div class='row p-1 article_box'>
				<div class='col-md-2 p-4 rounded border' style='text-align: center'>
					<div>
						<strong>{$smarty.foreach.loop.iteration}樓</strong>
					</div>
					<div class='mt-4'>
						<img src="/images/userImages/{$comment['user_image']}.jpg" height='100' width='100' />
					</div>
					<div class='mt-4'>
						<a href="userProfile.php?id={$comment['user_id']}">{$comment['user_name']}</a>
					</div>
					<div class='mt-4'>
						<button class='btn btn-outline-primary'>加為好友</button>
					</div>
				</div>
				<div class='col-md-10'>
					<div class='float-left' style='font-size: 0.8rem; color: gray'>
						發表時間：{$comment['create_time']}
					</div>
					<div class='float-right'>
						[&nbsp;<a href='#'>引用留言</a>&nbsp;]
						[&nbsp;<a href='#'>檢舉</a>&nbsp;]
						[&nbsp;<a href='#'>到最新回文</a>&nbsp;]
					</div>
					<div class='mt-3 p-3' style='clear: both'>
						{$comment['content']}
					</div>
				</div>
			</div>
		{/foreach}
		
	</div>
{/block}