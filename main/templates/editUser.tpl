{extends file='route.tpl'}
{block name='plugin'}
	{literal}
	<script>
		function next_step() {
			var username = $("input[name='username']").val();
			if (username.length == 0) {
				$("[id='username']").show();
				return false;
			}

			var nickname = $("input[name='nickname']").val();
			if (nickname.length == 0) {
				$("[id='nickname']").show();
				return false;
			}

			var password = $("input[name='password']").val();
			if (password.length == 0) {
				$("[id='password']").show();
				return false;
			}

			var email = $("input[name='email']").val();
			if (email.length == 0) {
				$("[id='email']").show();
				return false;
			}

			var money = $("input[name='money']").val();
			if (money.length == 0) {
				$("[id='money']").show();
				return false;
			}

			$("#register_form").submit();
		}
	</script>
	{/literal}
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row mb-3'>
			<h1>用戶資訊修改</h1>
		</div>
		<form id='register_form' method='POST' action="editUser.php?id={$row['id']}">
			<input name='edit_user_submit' value='edit_user_submit' hidden>
			<div class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>帳號:</span>
				</div>
				<input type='text' class='form-control' name='username' value="{$row['username']}" readonly>
			</div>
			<div id='username' class='alert alert-danger alert-dismissable' style='display: none'>
				<button type='button' class='close' data-dismiss='alert'>&times;</button>
				請輸入帳號！
			</div>
			<div class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>暱稱:</span>
				</div>
				<input type='text' class='form-control' name='nickname' value="{$row['nickname']}">
			</div>
			<div id='nickname' class='alert alert-danger alert-dismissable' style='display: none'>
				<button type='button' class='close' data-dismiss='alert'>&times;</button>
				請輸入暱稱！
			</div>
			<div class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>密碼:</span>
				</div>
				<input type='text' class='form-control' name='password' value="{$row['password']}">
			</div>
			<div id='password' class='alert alert-danger alert-dismissable' style='display: none'>
				<button type='button' class='close' data-dismiss='alert'>&times;</button>
				請輸入密碼！
			</div>
			<div class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>性別:</span>
				</div>
				<select class='form-control' name='gender'>
					<option value='0'{if $row['gender'] == 0} selected{/if}>男</option>
					<option value='1'{if $row['gender'] == 1} selected{/if}>女</option>
				</select>
			</div>
			<div class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>信箱:</span>
				</div>
				<input type='text' class='form-control' name='email' value="{$row['email']}">
			</div>
			<div id='email' class='alert alert-danger alert-dismissable' style='display: none'>
				<button type='button' class='close' data-dismiss='alert'>&times;</button>
				請輸入信箱！
			</div>
			<div id='money' class='input-group input-group-lg mb-3'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>錢包:</span>
				</div>
				<input type='text' class='form-control' name='money' value="{$row['money']}">
				<div class='input-group-append'>
					<span class='input-group-text'>元</span>
				</div>
			</div>
			<div class='alert alert-danger alert-dismissable' style='display: none'>
				<button type='button' class='close' data-dismiss='alert'>&times;</button>
				請輸入！
			</div>
		</form>
		<div class='row justify-content-end'>
			<button class='m-3 btn btn-lg btn-secondary' onclick="window.location.href = 'listUser.php';">上一頁</button>
			<button class='m-3 btn btn-lg btn-primary' onclick="next_step()">確認修改</button>
		</div>
	</div>
{/block}