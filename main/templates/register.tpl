<script src='javascripts/validate_email.js'></script>
<script src='javascripts/register.js'></script>
<div class='container w-75'>
	<img class="center" src="images/logo.jpg" height= "600px" width="800px">
	<div class='row justify-content-center mb-5 mt-5'>
		<h1>立即註冊</h1>
	</div>
	<form>
		<input hidden name='register_submit' value='true'>
		<div class='row'>
			<!-- Username -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">帳號:</span>
					</div>
					<input class="form-control form-control-lg" type="text" name="username" placeholder="請輸入帳號" autofocus onkeyup="check_username();" />
				</div>
				<div id='exist-username' class='text-center text-danger' style='display: none'>
					此帳號名稱已存在
				</div>
				<div id='alert-username' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					請輸入合法使用者名稱！
				</div>
			</div>

			<!-- Nickname -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">暱稱:</span>
					</div>
					{if !empty($nickname)}
						<input class='form-control form-control-lg' type='text' name='nickname' value='{$nickname}' onkeyup='check_nickname();' />
					{else}
						<input class="form-control form-control-lg" type="text" name="nickname" placeholder="請輸入暱稱" onkeyup='check_nickname();' />
					{/if}
				</div>
				<div id='exist-nickname' class='text-center text-danger' style='display: none'>
					此暱稱名稱已存在
				</div>
				<div id='alert-nickname' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					請輸入合法暱稱！
				</div>
			</div>

			<!-- Password -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">密碼:</span>
					</div>
					<input class="form-control form-control-lg" type="password" name="password" placeholder="請輸入密碼" />
				</div>
				<div id='alert-password' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					請輸入密碼！
				</div>
			</div>

			<!-- Confirmed Password -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">確認密碼:</span>
					</div>
					<input class="form-control form-control-lg" type="password" name="c-password" placeholder="請確認密碼" />
				</div>
				<div id='alert-c-password' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					與密碼不符！
				</div>
			</div>

			<!-- Gender -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">性別:</span>
					</div>
					<select class="form-control form-control-lg" name="gender">
						<option value='' selected></option>
						<option value='0'>男</option>
						<option value='1'>女</option>
					</select>
				</div>
			</div>

			<!-- Email -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class="input-group input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text">信箱:</span>
					</div>
					{if !empty($email)}
						<input class='form-control form-control-lg' type='text' name='email' value='{$email}' readonly />
					{else}
						<input class="form-control form-control-lg" type="text" name="email" placeholder="請輸入信箱" onkeyup='check_email()' />
					{/if}
				</div>
				<div id='exist-email' class='text-center text-danger' style='display: none'>
					此信箱名稱已存在
				</div>
				<div id='alert-email' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					請輸入合法的信箱！
				</div>
			</div>

			<!-- promo -->
			<div class='col-md-6 col-sm-12 mb-5'>
				<div class='input-group input-group-lg'>
					<div class='input-group-prepend'>
						<span class='input-group-text'>優惠碼:</span>
					</div>
					{if !empty($promo)}
						<input class='form-control form-control-lg' type='text' name='promo' value='{$promo}'>
					{else}
						<input class='form-control form-control-lg' type='text' name='promo' placeholder='請輸入優惠碼'>
					{/if}
				</div>
			</div>
		</div>
	</form>
	<div class='row mb-5'>
		<div class='col-12 text-center'>
			<input class="form-check-input" type="checkbox" name="terms" value="" />
			我同意&nbsp;<a href="/">服務條款</a>&nbsp;、&nbsp;<a href="/">停權管理規章</a>&nbsp;和&nbsp;<a href="/privacy-policy.php">隱私政策&nbsp;，</a><br>同時也了解若我未滿20歲，我的法定代理人或監護人必須代表我完整檢閱和同意使用條款。
		</div>
	</div>
	<div class='row justify-content-end mb-5'>
		<div class='col-sm-12 col-md-6 col-lg-3'>
			<button class='btn btn-lg btn-dark w-100' onclick='validate_registration()'>下一步</button>
		</div>
	</div>
</div>

<!-- Double Check Modal -->
<div class='modal' id='double-check-modal'>
	<div class='modal-dialog modal-dialog-centered modal-lg'>
		<div class='modal-content'>
			<!-- Modal header -->
			<div class='text-center border-bottom p-3'>
				<h2 class='modal-title'>資料確認</h2>
				<h3 class='modal-title'>部份資料送出後無法再做修改</h3>
			</div>
			<!-- Modal body -->
			<div class='text-center mt-3 p-3'>
				<h4 id='modal-username' class='mb-3'><strong>帳號：</strong></h4>
				<h4 id='modal-nickname' class='mb-3'><strong>暱稱：</strong></h4>
				<h4 id='modal-email'><strong>信箱：</strong></h4>
			</div>
			<!-- Modal footer -->
			<div class='modal-footer'>
				<button type='button' class='btn btn-danger' onclick='close_double_check_modal()'>取消</button>
				<button type='button' class='btn btn-success' onclick='ajax_register()'>確認並註冊</button>
			</div>
		</div>
	</div>
</div>
<!-- Old 
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
								<p class="alert alert-danger" id="username_notice" hidden>請填入帳號！</p>
								<p class="alert alert-danger" id="invalid_username" hidden>不合法的帳號名稱</p>
							</td>
							<td class='col-sm-6'>
								<div class="input-group mb-3 input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text">暱稱:</span>
									</div>
									{if !empty($nickname)}
										<input class='form-control form-control-lg' type='text' id='nickname' name='nickname' value='{$nickname}' />
									{else}
										<input class="form-control form-control-lg" type="text" id="nickname" name="nickname" placeholder="請輸入暱稱" />
									{/if}
								</div>
								<p class="alert alert-danger" id="nickname_notice" hidden>請輸入暱稱！</p>
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
								<p class="alert alert-danger" id="password_notice" hidden>請輸入密碼！</p>
							</td>
							<td class='col-sm-6'>
								<div class="input-group mb-3 input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text">性別:</span>
									</div>
									<select class="form-control form-control-lg" id="gender" name="gender">
										<option value='' selected></option>
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
								<p class="alert alert-danger" id="confirmed_notice" hidden>與密碼不符！</p>
							</td>
							<td class='col-sm-6'>
								<div class="input-group mb-3 input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text">信箱:</span>
									</div>
									{if !empty($email)}
										<input class='form-control fomr-control-lg' type='text' id='email' name='email' value='{$email}' readonly />
									{else}
										<input class="form-control form-control-lg" type="text" id="email" name="email" placeholder="請輸入信箱" />
									{/if}
								</div>
								<p class="alert alert-danger" id="email_notice" hidden>請輸入合法的信箱！</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="register_box">
				<input class="form-check-input" type="checkbox" name="terms" value="" />
					我同意&nbsp;<a href="/">服務條款</a>&nbsp;、&nbsp;<a href="/">停權管理規章</a>&nbsp;和&nbsp;<a href="/privacy-policy.php">隱私政策&nbsp;，</a><br />同時也了解若我未滿20歲，我的法定代理人或監護人必須代表我完整檢閱和同意使用條款。
				<br /><br /><br />
			</div>
			<div class="register_box">
				<input type='hidden' name='submit' />
				<button class="btn btn-lg btn-dark" type="submit" style="width: 50%; float: right;">下一步</button>
			</div>
		</form>
	</div>
</div>

-->