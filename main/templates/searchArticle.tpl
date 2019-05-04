{extends file='route.tpl'}
{block name='body'}
	<div class='container'>
		<div class='row mb-3'>
			<a class='text-dark' href='searchArticle.php'><h2>討論版</h2></a>
			<a class='btn btn-lg' href='addArticle.php'>新增文章</a>
			<a class='btn btn-lg' href='#'>版規</a>
		</div>
		<div class='row mb-3'>
			<div class='col-sm-1'>
				看板
			</div>
			<div class='col-sm-1'>
				{foreach from=$classes item=class}
					<div class='row'>
						<span class='text-success'>{$class['name']}</span>
					</div>
				{/foreach}
			</div>
			<div class='col-sm-10'>
				{foreach from=$classes item=class}
					<div class='row'>
						{foreach from=$categories item=category}
							{if $category['class_id'] == $class['id']}
								<a class='pr-3' href="searchArticle.php?category_id={$category['id']}">{$category['name']}</a>
							{/if}
						{/foreach}
					</div>
				{/foreach}
			</div>
		</div>
		<div class="input-group">
			<form method="GET" class='w-100'>
				<div class="input-group-append">
					{if isset($smarty.get.category_id)}
						<input name='category_id' value="{$smarty.get.category_id}" hidden />
					{/if}
					<input class="form-control border-secondary py-2" type="search" placeholder="請輸入關鍵字" name="search" />
					<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
				</div>
			</form>
		</div>
		</br>

		<script type="text/javascript" src="javascripts/articlePage.js"></script>

		<nav aria-label="Page navigation example">
		 	<ul class="pagination justify-content-center">
		   		<li class="page-item">
		     		<a class="page-link" href="searchArticle.php?page_id={$page_id-1}">Previous</a>
		    	</li>

		    	{for $i =$page_id-2 to $page_id+2}
			    	{if $i >=1 and $i <= $maxPage}
			    		<li class="page-item"><a class="page-link" href="searchArticle.php?page_id={$i}">{$i}</a></li>
			    	{/if}
		    	{/for}

		    	<li class="page-item">
		      		<a class="page-link" href="searchArticle.php?page_id={$page_id+1}">Next</a>
		    	</li>
		  	</ul>
		</nav>

		<div class='row mt-5'>
			{if count($data) == 0}
				<h3>沒有結果</h3>
			{else}
				<table class='table table-bordered table-striped table-sm'>
					<thead>
						<tr class='d-flex text-center'>
							<th class='col-sm-7'>主題</th>
							<th class='col-sm-1'>&nbsp;</th>
							<th class='col-sm-2'>作者</th>
							<th class='col-sm-2'>最新回覆</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$data item=row}
							<tr class='d-flex'>
								<td class='col-sm-7'>
									&#91;{$row['category_name']}&#93;&nbsp;
									<a href="/showArticle.php?id={$row['id']}">{$row['title']}</a>
								</td>
								<td class='col-sm-1 text-center'>
									<img src='/images/user_default.jpg' height='50px' width='50px' />
								</td>
								<td class='col-sm-2 text-center'>
									<a href="/userProfile.php?id={$row['author']}">{$row['user_username']}</a>
									<br />{$row['update_time']|date_format:'%Y-%m-%d %H:%M:%S'}
								</td>
								<td class='col-sm-2 text-center'>
									<a href="/userProfile.php?id={$row['author']}">{$row['user_username']}</a>
									<br />{$row['update_time']|date_format:'%Y-%m-%d %H:%M:%S'}
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			{/if}
		</div>
	</div>
{/block}