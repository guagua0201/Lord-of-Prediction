{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 67.5vh'>
		<form id='userUpdatePass' method='post' action='userUpdatePass.tpl'>
			<div class='row mb-3'>
				<h2 class='mr-3'>重新設置密碼</h2>
				<h3>{$user['username']} ({$user['nickname']})</h3>
			</div>
			<div class='row'>
				<input hidden name='user_id' value="{$user['id']}">
				<div class='input-group input-group-lg'>
					<div class='input-group-prepend'>
						<span class='input-group-text'>
							重新輸入密碼
						</span>
					</div>
					<input type='password' class='form-control form-control-lg' name='password'>
					<div class='input-group-append'>
						<button type='button' class='btn btn-lg btn-outline-dark'>送出</button>
					</div>
				</div>
			</div>
		</form>
	</div>
{/block}