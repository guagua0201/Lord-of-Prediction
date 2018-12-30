{extends file='route.tpl'}
{block name='body'}
	<div class="container" style="text-align: center; min-height: 68vh; padding: 30px 0">
		<script src="/javascripts/register_form_check.js" type="text/javascript"></script>
		<div style="height: 100%; width: 70%; margin: 0 auto;">
			<form id="register_form" method="POST" action="/editUser.php?id={$row['id']}" onsubmit="return checkForm(this);">
				<input hidden readonly name='id' value = "{$row['id']}" />
				<div class="editUser_box" style='margin-top: 0'>
					<h1>用戶資訊修改</h1>
				</div>
				<div class="editUser_box">
					<p></p>
					<table style="width: 100%;">
						<tbody>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="username" name="username" value="{$row['username']}" readonly />
										<p class="text-danger" id="username_notice" hidden="hidden">請填入帳號！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="nickname" name="nickname" value="{$row['nickname']}" />
										<p class="text-danger" id="nickname_notice" hidden="hidden">請輸入暱稱！</p>
									</div>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="password" name="password" value="{$row['password']}" />
										<p class="text-danger" id="password_notice" hidden="hidden">請輸入密碼！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<select class="form-control form-control-lg" id="gender" name="gender">
											{if $row['gender'] == 0}
												<option value='0' selected>男</option>
												<option value='1'>女</option>
											{else}
												<option value='0'>男</option>
												<option value='1' selected>女</option>
											{/if}
										</select>
									</div>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="confirmed_pwd" name="confirmed-pwd" value="{$row['password']}" />
										<p class="text-danger" id="confirmed_notice" hidden="hidden">與密碼不符！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="email" name="email" value="{$row['email']}" />
										<p class="text-danger" id="email_notice" hidden="hidden">請輸入合法的信箱！</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="editUser_box">
					<input class="form-check-input" type="checkbox" name="terms" checked hidden/>
				</div>
				<div class="editUser_box">
					<input type='hidden' name='submit' />
					<button class="btn btn-lg btn-dark" type="submit" style="width: 50%; float: right;">提交</button>
				</div>
			</form>
		</div>
	</div>
{/block}