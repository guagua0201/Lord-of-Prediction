{extends file='route.tpl'}
{block name='body'}
	<div class="container" style='min-height: 68vh'>
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<form method="GET" action="listUser.php" style="width: 100%;">
						<div class="input-group-append">
							<input class="form-control border-secondary py-2" type="search" placeholder="輸入用戶暱稱" name="search" />
							<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
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
					<table class='table table-striped table-hover'>
						<thead>
							<tr>
								<th></th>
								<th>用戶名</th>
								<th>密碼</th>
								<th>信箱</th>
								<th>暱稱</th>
								<th>性別</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$data item=row}
								<tr>
									<td>
										<img src='images/user_default.jpg' height='100px', width='100px' />
									</td>
									<td>{$row['username']}</td>
									<td>{$row['password']}</td>
									<td>{$row['email']}</td>
									<td>{$row['nickname']}</td>
									<td>
										{if $row['gender'] == 0}
											男
										{else}
											女
										{/if}
									</td>
									<td>
										<a href="editUser.php?id={$row['id']}" title='Edit user' class='icon'>
											<button class='btn btn-outline-secondary'>
												<i class='fa fa-pencil'></i>
											</button>
										</a>
										<a href="deleteUser.php?id={$row['id']}" title='Delete user' class='icon'>
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
	</div>
{/block}