{extends file='route.tpl'}
{block name='body'}
	<script src="/javascripts/register_form_check.js" type="text/javascript"></script>
	<div class="container" style="text-align: center; min-height: 68vh; padding: 30px 0">
		<div style="height: 100%; width: 80%; margin: 0 auto;">
			<form id="register_form" method="POST" action='/register.php' onsubmit="return checkForm(this);">
				<div class="register_box" style='margin-top: 0; margin-bottom: 30px'>
					<h1>成為預言王</h1>
				</div>
				<div class="register_box">
					<table style="width: 100%;">
						<tbody>
							<tr class="spaceUnder d-flex">
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">帳號:</span>
    									</div>
										<input class="form-control form-control-lg" type="text" id="username" name="username" placeholder="請輸入帳號" />
									</div>
									<p class="alert alert-danger" id="username_notice" hidden="hidden">請填入帳號！</p>
								</td>
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">暱稱:</span>
    									</div>
										<input class="form-control form-control-lg" type="text" id="nickname" name="nickname" placeholder="請輸入暱稱" />
									</div>
									<p class="alert alert-danger" id="nickname_notice" hidden="hidden">請輸入暱稱！</p>
								</td>
							</tr>
							<tr class="spaceUnder d-flex">
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">密碼:</span>
    									</div>
										<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="請輸入密碼" />
									</div>
									<p class="alert alert-danger" id="password_notice" hidden="hidden">請輸入密碼！</p>
								</td>
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">性別:</span>
    									</div>
										<select class="form-control form-control-lg" id="gender" name="gender">
											<option value='0'>男</option>
											<option value='1'>女</option>
										</select>
									</div>
								</td>
							</tr>
							<tr class="spaceUnder d-flex">
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">確認密碼:</span>
    									</div>
										<input class="form-control form-control-lg" type="password" id="confirmed_pwd" name="confirmed-pwd" placeholder="請確認密碼" />
									</div>
									<p class="alert alert-danger" id="confirmed_notice" hidden="hidden">與密碼不符！</p>
								</td>
								<td class='col-sm-6'>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
    										<span class="input-group-text">信箱:</span>
    									</div>
										<input class="form-control form-control-lg" type="text" id="email" name="email" placeholder="請輸入信箱" />
									</div>
									<p class="alert alert-danger" id="email_notice" hidden="hidden">請輸入合法的信箱！</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="register_box">
					<input class="form-check-input" type="checkbox" name="terms" value="" />我同意&nbsp;<a href="/">服務條款</a>&nbsp;、&nbsp;<a href="/">停權管理規章</a>&nbsp;和&nbsp;<a href="/">
					隱私政策&nbsp;，</a><br />同時也了解若我未滿20歲，我的法定代理人或監護人必須代表我完整檢閱和同意使用條款。
					<br /><br /><br />
				</div>
				<div class="register_box">
					<input type='hidden' name='submit' />
					<button class="btn btn-lg btn-dark" type="submit" style="width: 50%; float: right;">下一步</button>
				</div>
			</form>
		</div>
	</div>
{/block}