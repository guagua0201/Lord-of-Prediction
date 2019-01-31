{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh' class='container'>
		<div class='row mb-3'>
			<a class='text-dark' href='searchArticle.php'><h2>討論版</h2></a>	
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
								<a class='pr-3' href="listArticle.php?category_id={$category['id']}">{$category['name']}</a>
							{/if}
						{/foreach}
					</div>
				{/foreach}
			</div>
		</div>
		<div class="input-group">
			<form method="GET" action="listArticle.php" style="width: 100%;">
				<div class="input-group-append">
					<input name='category_id' value="{$category_id}" hidden />
					<input class="form-control border-secondary py-2" type="search" placeholder="請輸入關鍵字" name="search" />
					<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
				</div>
			</form>
		</div>
		<div class='row mt-3'>
			{if count($data) == 0}
				<h3>沒有結果</h3>
			{else}
				<table style='margin-top: 50px' class='table table-bordered table-striped table-sm'>
					<thead>
						<tr class='d-flex' style='text-align: center'>
							<th class='col-sm-6'>主題</th>
							<th class='col-sm-1'>&nbsp;</th>
							<th class='col-sm-2'>作者</th>
							<th class='col-sm-2'>最新回覆</th>
							<th class='col-sm-1'></th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$data item=row}
							<tr class='d-flex'>
								<td class='col-sm-6'>
									&#91;{$row['category_name']}&#93;&nbsp;
									<a href="/showArticle.php?id={$row['id']}">{$row['title']}</a>
								</td>
								<td class='col-sm-1' style='text-align: center'>
									<img src='/images/user_default.jpg' height='50px' width='50px' />
								</td>
								<td class='col-sm-2' style='text-align: center'>
									<a href="/userProfile.php?id={$row['author']}">{$row['user_username']}</a>
									<br />{$row['update_time']|date_format:'%Y-%m-%d %H:%M:%S'}
								</td>
								<td class='col-sm-2' style='text-align: center'>
									<a href="/userProfile.php?id={$row['author']}">{$row['user_username']}</a>
									<br />{$row['update_time']|date_format:'%Y-%m-%d %H:%M:%S'}
								</td>
								<td class='col-sm-1'>
									<a href="editArticle.php?id={$row['id']}" title='Edit article' class='icon'>
										<button class='btn btn-outline-secondary'>
											<i class='fa fa-pencil'></i>
										</button>
									</a>
									<a href="deleteArticle.php?id={$row['id']}" title='Delete article' class='icon'>
										<button class='btn btn-outline-secondary'>
											<i class='fa fa-trash'></i>
										</button>
									</a>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			{/if}
		</div>
	</div>
{/block}