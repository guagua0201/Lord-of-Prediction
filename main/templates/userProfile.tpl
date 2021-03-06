{extends file='route.tpl'}
{block name='plugin'}
<script src='/javascripts/validate_email.js'></script>
<script>
	function check() {
		var nickname = $("input[name='nickname']").val();
		if (nickname.length == 0) {
			$("[id='nickname']").show();
			return false;
		}

		var old_password = $("input[name='old-password']").val();
		if (old_password.length == 0) {
			$("[id='old-password']").show();
			return false;
		}

		var new_password = $("input[name='new-password']").val();
		var rep_password = $("input[name='rep-password']").val();
		if (rep_password != new_password) {
			$("[id='new-password']").show();
			return false;
		}

		var email = $("input[name='email']").val();
		if (email.length == 0 || validateEmail(email) == false) {
			$("[id='email']").show();
			return false;
		}

		// console.log("HI");
		// return false;

		$("#edit_form").submit();
	}
</script>
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row'>
			<div class='col-md-2'>
				<div class='d-flex flex-column border'>
					<div class='p-2 text-center'>
						<img src="/images/userImages/{$user_info['image']}.jpg" height='100' width='100'>
					</div>
					<div class='p-2 text-center'>
						<strong>{$user_info['nickname']}</strong>
					</div>
					<div class='p-2 text-center'>
						<ul class='nav flex-column'>
							<li>
								<a href='userProfile.php?show=predict&user_id={$smarty.get.user_id}'>
									<strong class="{if $smarty.get.show == 'predict'}active{/if}">預測</strong>
								</a>
							</li>
							<li>
								<a href='#'>
									<strong class="{if $smarty.get.show == 'article'}active{/if}">討論</strong>
								</a>
							</li>
							{if $smarty.session.user_id == $smarty.get.user_id}
								<li>
									<a href='userProfile.php?show=edit&user_id={$smarty.session.user_id}'>
										<strong class="{if $smarty.get.show == 'edit'}active{/if}">修改個人資訊</strong>
									</a>
								</li>
							{/if}
						</ul>
					</div>
				</div>
			</div>
			<div class='col-md-10 border'>
				{if $smarty.get.show == 'predict'}
					<!-- Catagories -->
					<div class='row p-2 mb-3 border-bottom'>
						<div class='col-md-1'>
							{foreach from=$classes item=class}
								<div class='row text-success pl-3'>
									{$class['name']}
								</div>
							{/foreach}
						</div>
						<div class='col-md-10'>
							{foreach from=$classes item=class}
								<div class='row'>
									{foreach from=$categories item=category}
										{if $category['class_id'] == $class['id']}
											<a class='mr-3' href="userProfile.php?user_id={$smarty.get.user_id}&category_id={$category['id']}">{$category['name']}</a>
										{/if}
									{/foreach}
								</div>
							{/foreach}
						</div>
					</div>
				{/if}
				{if $smarty.get.show == 'predict'}
					<!-- Predicts -->
					<div class='row p-2 mb-3 border-bottom'>
						{assign var = 'is_user' value = $smarty.get.user_id == $smarty.session.user_id}
						{if count($predicts) == 0}
							<div class='w-100 text-center'>
								<h5>
									{if $is_user}
										前往<a href='predictGame.php'>預測賽事</a>
									{else}
										購買預測
									{/if}
								</h5>
							</div>
						{else}
							<div class='table-responsive'>
								<table class='table table-hover table-striped table-bordered'>
									<thead class='thead-dark font-weight-bold text-center'>
										<tr>
											<td class='col-md-7' colspan='3'>賽事資訊</td>
											<td class='col-md-4'>預測</td>
											{if $is_user}
												<td class='col-md-1'>刪除</td>
											{else}
												<td class='col-md-1'>購買</td>
											{/if}
										</tr>
									</thead>
									<tbody>
										{literal}
										<script>
											$(document).ready(function() {
												$('#buy-confirm').click(function(element) {
													if (confirm('確定要購買這個預測嗎？')) {
														var postData = 'user_id=' + $("input[name='user_id']").val() + '&predict_id=' + $("input[name='predict_id']").val();
														$.ajax({
															type: 'POST',
															url: 'buyPredict.php',
															data: postData,
															success: function(response) {
																if (response == 'false') {
																	alert('餘額不足！');
																	window.location = "/index.php";
																} else if (response == 'true') {
																	alert('購買成功！');
																	window.location = "/userProfile.php?user_id=" + $("input[name='user_id']").val();
																}
															}
														});
													}
												});
											});
										</script>
										{/literal}
										{foreach from=$predicts item=predict}
											<tr>
												<td class='text-center'>
													{$predict['game_id']}
												</td>
												<td class='text-center col-md-2'>
													<strong>{$predict['game_date']|date_format:"%m\%d %H:%M"}</strong>
												</td>
												<td>
													{$predict['game_away_team']} VS {$predict['game_home_team']}(主)
												</td>
												<td>
													{if $predict['predict'] == 'a'}
														<strong>讓分: </strong>{if $is_user}{$predict['game_away_team']}{else}......{/if}
													{else if $predict['predict'] == 'A'}
														<strong>讓分: </strong>{if $is_user}{$predict['game_home_team']}{else}......{/if}
													{else if $predict['predict'] == 'b'}
														<strong>大小: </strong>{if $is_user}大{else}......{/if}
													{else if $predict['predict'] == 'B'}
														<strong>大小: </strong>{if $is_user}小{else}......{/if}
													{else if $predict['predict'] == 'c'}
														<strong>不讓分: </strong>{if $is_user}{$predict['game_away_team']}{else}......{/if}
													{else if $predict['predict'] == 'C'}
														<strong>不讓分: </strong>{if $is_user}{$predict['game_home_team']}{else}......{/if}
													{else if $predict['predict'] == 'd'}
														<strong>一輸二贏: </strong>{if $is_user}{$predict['game_away_team']} 一輸{else}......{/if}
													{else if $predict['predict'] == 'D'}
														<strong>一輸二贏: </strong>{if $is_user}{$predict['game_home_team']} 一輸{else}......{/if}
													{else if $predict['predict'] == 'e'}
														<strong>單雙: </strong>{if $is_user}單{else}......{/if}
													{else if $predict['predict'] == 'E'}
														<strong>單雙: </strong>{if $is_user}雙{else}......{/if}
													{/if}
												</td>
												<td class='text-center'>
													{if $is_user}
														<a href="deletePredict.php?id={$predict['id']}" onclick="return confirm('確定要刪除這個預測嗎？');">
															<i class="fa fa-trash text-dark" aria-hidden="true"></i>
														</a>
													{else}
														<a id='buy-confirm' class='text-danger' href='#'>
															<input name='user_id' value='{$smarty.session.user_id}' hidden>
															<input name='predict_id' value="{$predict['id']}" hidden>
															{$predict['price']} <i class="fa fa-usd" aria-hidden="true"></i>
														</a>
													{/if}
												</td>
											</tr>
										{/foreach}
									</tbody>
								</table>
							</div>
						{/if}
					</div>
				{/if}
				{if $smarty.get.show == 'predict' && isset($rating)}
					<!-- Rating -->
					<div class='row p-2 mb-3 border-bottom'>
						<h3>預測：</h3>
						<h3 class='text-success'>{$rating['success']}勝</h3>
						<h3 class='text-danger'>{$rating['failure']}敗</h3>

					</div>
					<div class='row p-2 mb-3 border-bottom'>
						<h3>勝率：</h3>
						<h3 class='text-dark'>{round($rating['success']/($rating['success'] + $rating['failure']),2)*100}%</h3>
					</div>
				{/if}
				{if $smarty.get.show == 'predict'}
					<!-- History Predicts -->
					<div class='row p-2 mb-3'>
						<div class='table-responsive'>
							<table class='table table-hover table-striped table-bordered'>
								<tr>
									<h3>歷史預測</h3>
								</tr>
								{foreach from=$history_predict item=history}
									<tr>
										<td class='text-center'>
											<strong>{$history['game_date']}</strong>
										</td>
										<td>
											{$history['game_away_team']} VS {$history['game_home_team']}(主)
										</td>
										<td>
											{if $history['predict'] == 'a'}
												<strong>讓分: </strong>{$history['game_away_team']}
											{else if $history['predict'] == 'A'}
												<strong>讓分: </strong>{$history['game_home_team']}
											{else if $history['predict'] == 'b'}
												<strong>大小: </strong>大
											{else if $history['predict'] == 'B'}
												<strong>大小: </strong>小
											{else if $history['predict'] == 'c'}
												<strong>不讓分: </strong>{$history['game_away_team']}
											{else if $history['predict'] == 'C'}
												<strong>不讓分: </strong>{$history['game_home_team']}
											{else if $history['predict'] == 'd'}
												<strong>一輸二贏: </strong>{$history['game_away_team']} 一輸
											{else if $history['predict'] == 'D'}
												<strong>一輸二贏: </strong>{$history['game_home_team']} 一輸
											{else if $history['predict'] == 'e'}
												<strong>單雙: </strong>單
											{else if $history['predict'] == 'E'}
												<strong>單雙: </strong>雙
											{/if}
										</td>
										<td class='text-center'>
											<strong>
												{if $history['predict_flag'] == 1}
													準
												{else if $history['predict_flag'] == 2}
													冏
												{else if $history['predict_flag'] == 3}
													?
												{/if}
											</strong>
										</td>
									</tr>
								{/foreach}
							</table>
						</div>
					</div>
				{/if}
				{if $smarty.get.show == 'edit'}
					<!-- Edit -->
					<div class='p-3 m-3'>
						<form id='edit_form' method='POST' action='editUser.php?id={$smarty.session.user_id}'>
							<h3>用戶資訊修改</h3>
							<input hidden name='edit_user_submit' value='true'>
							<input hidden name='password' value="{$userdata['password']}">
							<input hidden name='gender' value="{$userdata['gender']}">
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>使用者 ID</span>
								</div>
								<input type='text' class='form-control' value='{$smarty.session.user_id}' readonly>
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>帳號名稱</span>
								</div>
								<input type='text' class='form-control' value="{$userdata['username']}" name='username' readonly>
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>暱稱</span>
								</div>
								<input type='text' class='form-control' value="{$userdata['nickname']}" name='nickname'>
							</div>
							<div id='nickname' class='alert alert-danger alert-dismissable' style='display: none'>
								<button type='button' class='close' data-dismiss='alert'>&times;</button>
								請輸入暱稱！
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>舊密碼</span>
								</div>
								<input type='password' class='form-control' name='old-password'>
							</div>
							<div id='old-password' class='alert alert-danger alert-dismissable' style='display: none'>
								<button type='button' class='close' data-dismiss='alert'>&times;</button>
								請輸入密碼！
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>新密碼</span>
								</div>
								<input type='password' class='form-control' name='new-password'>
							</div>
							<div id='new-password' class='alert alert-danger alert-dismissable' style='display: none'>
								<button type='button' class='close' data-dismiss='alert'>&times;</button>
								兩次輸入的密碼不符！
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>再次輸入密碼</span>
								</div>
								<input type='password' class='form-control' name='rep-password'>
							</div>
							<div class='input-group mb-3'>
								<div class='input-group-prepend'>
									<span class='input-group-text'>信箱</span>
								</div>
								<input type='text' class='form-control' value="{$userdata['email']}" name='email'>
							</div>
							<div id='new-password' class='alert alert-danger alert-dismissable' style='display: none'>
								<button type='button' class='close' data-dismiss='alert'>&times;</button>
								請輸入正確的信箱！
							</div>
						</form>
						<button class='btn btn-primary ml-auto' onclick='check()'>
							儲存修改
						</button>
					</div>
				{/if}
			</div>
		</div>
	</div>
{/block}
