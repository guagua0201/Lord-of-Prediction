{extends file='route.tpl'}
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
								<a href='#'>
									<strong class="{if $smarty.get.show == 'predict'}active{/if}">預測</strong>
								</a>
							</li>
							<li>
								<a href='#'>
									<strong class="{if $smarty.get.show == 'article'}active{/if}">討論</strong>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class='col-md-10 border'>
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
												<strong>{$predict['game_date']}</strong>
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
				<div class='row p-2 mb-3'>
					{if $smarty.get.show == 'predict'}
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
												{/if}
											</strong>
										</td>
									</tr>
								{/foreach}
							</table>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/block}