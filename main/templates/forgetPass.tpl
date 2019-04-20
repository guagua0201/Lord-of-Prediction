{extends file='route.tpl'}
{block name='plugin'}
	<script src='validate_email.js'></script>
	<script src='forgetPass.js'></script>
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
						<button class='btn btn-lg btn-outline-dark' onclick='form_submit()'>送出</button>
					</div>
				</div>
			</div>
		</form>
	</div>
{/block}