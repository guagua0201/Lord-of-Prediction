{extends file='route.tpl'}
{block name='plugin'}
	<script src='javascripts/validate_email.js'></script>
	<script src='javascripts/forgetPass.js'></script>
{/block}
{block name='body'}
	<div class='container' style='min-height: 67.5vh'>
		<div class='row mb-3'>
			<h2>忘記密碼</h2>
		</div>
		<form method='post' action='forgetPass.php'>
			<div class='row'>
				<div class='input-group input-group-lg'>
					<div class='input-group-prepend'>
						<span class='input-group-text'>輸入電子信箱</span>
					</div>
					<input type='text' class='form-control form-control-lg' name='email'>
					<div class='input-group-append'>
						<button class='btn btn-lg btn-outline-dark' onclick='forgetPass()'>送出</button>
					</div>
				</div>
				<div id='exist-email' class='text-center text-danger' style='display: none'>
					 此信箱名稱不存在
				</div>
				<div id='alert-email' class='alert alert-danger alert-dismissable' style='display: none'>
					<button type='button' class='close' data-dismiss='alert'>&times;</button>
					請輸入合法的信箱！
				</div>
			</div>
		</form>
	</div>
{/block}