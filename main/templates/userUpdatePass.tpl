{extends file='route.tpl'}
{block name='plugin'}
	<script src='javascripts/userUpdatePass.js'></script>
{/block}
{block name='body'}
	<div class='container' style='min-height: 67.5vh'>
		<form id='userUpdatePass' method='post' action='userUpdatePass.php'>
			<div class='row mb-3'>
				<h2 class='mr-3'>重新設置密碼</h2>
				<h3>{$user['username']} ({$user['nickname']})</h3>
			</div>
			<div class='row'>
				<input hidden name='id' value="{$user['id']}">
				<div class='input-group input-group-lg'>
					<div class='input-group-prepend'>
						<span class='input-group-text'>
							重新輸入密碼
						</span>
					</div>
					<input type='password' class='form-control form-control-lg' name='password'>
					<div id='alert-password' class='w-100 alert alert-danger alert-dismissable' style='display: none'>
						<button type='button' class='close' data-dismiss='alert'>&times;</button>
						請輸入合法的密碼！
					</div>
					<div class='input-group-append'>
						<button type='button' class='btn btn-lg btn-outline-dark' onclick='userUpdatePass()'>送出</button>
					</div>
				</div>
			</div>
		</form>
	</div>
{/block}