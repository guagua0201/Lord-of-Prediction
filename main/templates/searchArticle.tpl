{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh' class='container'>
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<div class='mb-3'>
						<h2 style='display: inline'>討論版</h2>
						<a class='btn btn-lg' href='addArticle.php'>新增文章</a>
						<a class='btn btn-lg' href='/'>版規</a>
					</div>
					<form method="GET" action="searchArticle.php" style="width: 100%;">
						<div class="input-group-append">
							<input class="form-control border-secondary py-2" type="search" placeholder="請輸入關鍵字" name="search" />
							<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style='margin-top: 30px'>
			{if count($data) == 0}
				<h3>沒有結果</h3>
			{else}
				<table class='table table-bordered table-striped table-sm'>
					<thead>
						<tr class='d-flex' style='text-align: center'>
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
							</tr>
						{/foreach}
					</tbody>
				</table>
			{/if}
		</div>
	</div>
{/block}