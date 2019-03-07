{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row'>
			<ul class='nav nav-tabs'>
				<li class='nav-item'>
					選擇?幣金額
				</li>
				<li class='nav-item'>
					選擇付款方式
				</li>
				<li class='nav-item'>
					完成交易
				</li>
			</ul>
		</div>
		<div class='row'>
			<div class='table-responsive'>
				<table class='table table-hover table-striped'>
					<thead class='thead-dark font-weight-bold'>
						<tr class='text-center'>
							<td class='col-md-3'>價格</td>
							<td class='col-md-6'>?幣</td>
							<td class='col-md-3'></td>
						</tr>
					</thead>
					<tbody class='lead'>
						<tr class='text-center'>
							<td class='col-md-3'>
								<strong>100</strong>元
							</td>
							<td class='col-md-6'>
								100?幣
							</td>
							<td class='col-md-3'>
								<button class='btn btn-dark'>
									<a class='text-light' href='buyCash.php?step=2&price=100'>買?幣</a>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
{/block}