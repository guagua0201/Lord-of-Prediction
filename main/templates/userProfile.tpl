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
			<div class='col-md-10'>
				{if $smarty.get.show == 'predict'}
					<div class='row'>
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
												{else}
													冏
												{/if}
											</strong>
										</td>
									</tr>
								{/foreach}
							</table>
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>
{/block}