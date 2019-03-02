{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row border p-2'>
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
								<a class='mr-3' href="predictGame.php?category_id={$category['id']}">{$category['name']}</a>
							{/if}
						{/foreach}
					</div>
				{/foreach}
			</div>
		</div>
		<div class='row mt-3'>
			<div class='table-responsive'>
				<table class='table table-hover table-striped table-bordered'>
					<thead class='thead-dark font-weight-bold text-center'>
						<tr>
							<td class='col-md-7' colspan='3'>賽事資訊</td>
							<td class='col-md-3'>預測</td>
							<td class='col-md-1'>預測人</td>
							<td class='col-md-1'>&nbsp;</td>
						</tr>
					</thead>
					<tbody>
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
										<strong>讓分: </strong>{$predict['game_away_team']}
									{else if $predict['predict'] == 'A'}
										<strong>讓分: </strong>{$predict['game_home_team']}
									{else if $predict['predict'] == 'b'}
										<strong>大小: </strong>大
									{else if $predict['predict'] == 'B'}
										<strong>大小: </strong>小
									{else if $predict['predict'] == 'c'}
										<strong>不讓分: </strong>{$predict['game_away_team']}
									{else if $predict['predict'] == 'C'}
										<strong>不讓分: </strong>{$predict['game_home_team']}
									{else if $predict['predict'] == 'd'}
										<strong>一輸二贏: </strong>{$predict['game_away_team']} 一輸
									{else if $predict['predict'] == 'D'}
										<strong>一輸二贏: </strong>{$predict['game_home_team']} 一輸
									{else if $predict['predict'] == 'e'}
										<strong>單雙: </strong>單
									{else if $predict['predict'] == 'E'}
										<strong>單雙: </strong>雙
									{/if}
								</td>
								<td class='text-center'>
									<a href="userProfile.php?user_id={$predict['predicter_id']}">{$predict['predicter_nickname']}</a>
								</td>
								<td class='text-center'>
									<strong>
										{if $predict['predict_flag'] == 1}
											準
										{else if $predict['predict_flag'] == 2}
											冏
										{else}
											<i class="fa fa-question" aria-hidden="true"></i>
										{/if}
									</strong>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>
	</div>
{/block}