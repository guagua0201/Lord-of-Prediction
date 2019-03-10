{extends file='route.tpl'}
{block name='plugin'}
	{literal}
	<script>
		function next_step() {
			var payment_method = $("input[name='payment-method']:checked");
			if (payment_method.length == 0) {
				alert('請選擇付款方式！');
				return false;
			}

			var user_name = $("input[name='user-name']").val();
			if (user_name.length == 0) {
				alert('請填寫姓名！');
				return false;
			}

			var phone_number = $("input[name='phone-number']").val();
			if (phone_number.length == 0) {
				alert('請填寫手機號碼！');
				return false;
			}

			$('#buy-cash').submit();
		};
	</script>
	{/literal}
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row'>
			<ul class='nav nav-tabs'>
				<li class='nav-item'>
					<a class='nav-link {if $smarty.get.step == 1}active{/if}' href='{if $smarty.get.step == 1}#{else}buyCash.php?step=1{/if}'>
						選擇?幣金額
					</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link {if $smarty.get.step == 2}active{else}disabled{/if}' href='#'>
						選擇付款方式
					</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link {if $smarty.get.step == 3}active{else}disabled{/if}' href='#'>
						完成交易
					</a>
				</li>
			</ul>
		</div>
		{if $smarty.get.step == 1}
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
								<td class='col-md-3 align-middle'>
									NTD <strong>100</strong>元
								</td>
								<td class='col-md-6 align-middle'>
									100?幣
								</td>
								<td class='col-md-3'>
									<a class='text-light' href='buyCash.php?step=2&price=100'>
										<button class='btn btn-dark btn-lg'>
											買?幣
										</button>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		{else if $smarty.get.step == 2}
			<div class='row'>
				<div class='col p-3 border'>
					<span class='float-right'>
						<h3>
							<strong>合計: </strong>
							{$smarty.get.price}元
						</h3>
					</span>
					<h3>{$smarty.get.price}元?幣</h3>
				</div>
			</div>
			<div class='row'>
				<div class='table-responsive'>
					<table class='table table-bordered'>
						<thead class='bg-dark text-light font-weight-bold'>
							<tr>
								<td class='col-md-4'>一般付款</td>
								<td class='col-md-4'>小額付款需加收15%手續費</td>
								<td class='col-md-4'>海外地區</td>
							</tr>
						</thead>
						<tbody>
							<form method='POST' action='buyCash.php' id='buy-cash'>
								<input name='buy_submit' value='buy_submit' hidden>
								<input name='price' value='{$smarty.get.price}' hidden>
								<tr>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												超商繳款：7-11、全家
											</label>
										</div>
									</td>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												手機付款
											</label>
										</div>
									</td>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												信用卡
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='credit'>
												信用卡
											</label>
											<i class='fa fa-cc-visa' aria-hidden='true'></i>
										</div>	
								</td>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												MYCARD點數
											</label>
										</div>
									</td>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												Paypal
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class='form-check'>
											<label class='form-check-label'>
												<input type='radio' class='form-check-input' name='payment-method' value='' disabled>
												ATM匯款
											</label>
										</div>
									</td>
								</tr>
							</form>
							</form>
						</tbody>
					</table>
				</div>
			</div>
			<div class='row'>
				<div class='table-responsive'>
					<table class='table'>
						<thead class='bg-dark text-light font-weight-bold'>
							<tr>
								<td>填寫資料</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label class='mr-3'>姓名: <input type='text' name='user-name' placeholder='姓名 (必填)'></label>
									<label class='ml-3'>電話: <input type='text' name='phone-number' placeholder='電話 (必填)'></label>
								</td>
							</tr>
							<tr>
								<td>
									<button class='btn btn-secondary' onclick="window.location.href = 'buyCash.php?step=1';">上一步</button>
									<button class='btn btn-primary' onclick="next_step()">下一步，前往結帳</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		{/if}
	</div>
{/block}