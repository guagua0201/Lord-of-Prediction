{extends file='route.tpl'}
{block name='body'}
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<h1>用戶搜尋</h1>
					<form method="GET" action="searchUser.php" style="width: 100%;">
						<div class='input-group'>
							<input class="form-control border-secondary py-2" type="search" placeholder="輸入用戶暱稱或用戶名" name="search" />
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style='margin-top: 50px' class='row'>
			<div class='col-12'>
				{if count($data) == 0}
					<h3>很抱歉沒有此用戶！</h3>
				{else}
					<table class='table table-striped table-hover table-bordered'>
						<thead>
							<tr>
								<th></th>
								<th>用戶名</th>
								<th>信箱</th>
								<th>暱稱</th>
								<th>性別</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$data item=row}
								<tr>
									<td>
										<img src='images/user_default.jpg' height='60px', width='60px' />
									</td>
									<td>{$row['username']}</td>
									<td>{$row['email']}</td>
									<td>{$row['nickname']}</td>
									<td>
										{if $row['gender'] == 0}
											男
										{else}
											女
										{/if}
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				{/if}
			</div>
		</div>
	</div>
{/block}