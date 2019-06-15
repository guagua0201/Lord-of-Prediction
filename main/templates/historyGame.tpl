{extends file='route.tpl'}
{block name='plugin'}
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
{literal}
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker({
			closeText: "關閉",
			prevText: "&#x3C;上個月",
			nextText: "下個月&#x3E;",
			currentText: "今天",
			monthNames: [ "一月","二月","三月","四月","五月","六月",
			"七月","八月","九月","十月","十一月","十二月" ],
			monthNamesShort: [ "一月","二月","三月","四月","五月","六月",
			"七月","八月","九月","十月","十一月","十二月" ],
			dayNames: [ "星期日","星期一","星期二","星期三","星期四","星期五","星期六" ],
			dayNamesShort: [ "週日","週一","週二","週三","週四","週五","週六" ],
			dayNamesMin: [ "日","一","二","三","四","五","六" ],
			weekHeader: "週",
			dateFormat: "yy/mm/dd",
			firstDay: 1,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: "年",
			onSelect: function() {
				$(this).parent().parent('form').submit();
			}
		});
	});
</script>
{/literal}
{/block}
{block name='body'}
	<div class='container'>
		<div class='row p-2 border'>
			<div class='col-md-10 col-sm-12'>
				<div class='d-flex flex-column mt-2'>
					{foreach from=$classes item=class}
						<div>
							<span class='text-success'>{$class['name']}</span>
							<span class='ml-3'>
								{foreach from=$categories item=category}
									{if $category['class_id'] == $class['id']}
										<a class='mr-3' href="historyGame.php?category_id={$category['id']}{if isset($smarty.get.date) && !empty($smarty.get.date)}&date={$smarty.get.date}{/if}">{$category['name']}</a>
									{/if}
								{/foreach}
							</span>
						</div>
					{/foreach}
				</div>
			</div>
			<div class='col-md-2 col-sm-12 border-left'>
				<div class='text-center align-items-center'>
					<form method='get' action='historyGame.php'>
						<p class='lead'>選擇日期</p>
						<p>
							<input hidden name='category_id' value='{$smarty.get.category_id}'>
							<input class='w-100' id='datepicker' name='date' value="{if isset($smarty.get.date) && !empty($smarty.get.date)}{$smarty.get.date}{else}{$smarty.now|date_format:"%Y/%m/%d"}{/if}">
						</p>
					</form>
				</div>
			</div>
		</div>
		{assign var="colorGray" value="#BBBBBB"}
		{assign var="colorCyan" value="#99D9EA"}
		{assign var="colorYellow" value="#FFEF84"}
		<div class='row mt-3'>
			<div class='table-responsive'>
				<table class='table table-bordered'>
					<thead class='thead-dark text-center font-weight-bold'>
						<tr>
							<div class='row'>
								<td class='col-md-1 align-middle' rowspan='2' style="background-color: {$colorGray}">賽事資訊</td>
								<td class='col-md-2 align-middle' rowspan='2' style="background-color: {$colorGray}">球隊資訊</td>
								<td class='col-md-7 align-middle' colspan='{if count($data)}{count($names)}{else}3{/if}' style="background-color: {$colorGray}">運彩盤</td>
							</div>
						</tr>
						<tr>
							<div class='row'>
								{if count($data) == 0}
									<td class='text-center align-middle'>讓分</td>
									<td class='text-center align-middle'>不讓分</td>
									<td class='text-center align-middle'>大小</td>
								{else}
								{assign "tagCnt" 0}
								{foreach from=$names item=name}
									{if $tagCnt % 2 == 0}
										{assign "nowColor" $colorYellow}
									{else}
										{assign "nowColor" $colorCyan}
									{/if}
									{assign "tagCnt" $tagCnt+1}
									{if $name != '主客隊' && $name != '比賽時間'}
										<td class='text-center align-middle' style="background-color: {$nowColor};">{$name}</td>
									{/if}
								{/foreach}
								{/if}
							</div>
						</tr>
					</thead>
					<tbody>
						{if count($data) == 0}
							<tr class='text-center'>
								<td colspan='5'>暫無資料</td>
							</tr>
						{else}
							{assign var="compCnt" value=0}
							{foreach from=$data item=row name=loop}
								{if $compCnt%2==0}
									{assign var="nowColor" value="#FFFFFF"}
								{else}
									{assign var="nowColor" value=$colorGray}
								{/if}
								{assign var="compCnt" value=$compCnt+1}
								{* Start *}
								{assign var=detail value=$row['details']}
								{assign var=a_score value=$row['a_score']}
								{assign var=h_score value=$row['h_score']}

								{* Handicap *}
								{if isset($detail['handicap'])}
									{assign var=h_handicap_class value="predict_fail"}
									{assign var=a_handicap_class value="predict_fail"}
									{assign var=handicap value=$detail['handicap']}
									{assign var=a_handicap_score value=$a_score}
									{if isset($handicap['a_spread'])}{$a_handicap_score = $a_handicap_score + $handicap['a_spread']}{/if}
									{assign var=h_handicap_score value=$h_score}
									{if isset($handicap['h_spread'])}{$h_handicap_score = $h_handicap_score + $handicap['h_spread']}{/if}
									{if $a_handicap_score > $h_handicap_score}
										{$h_handicap_class = "predict_success"}
									{else if $a_handicap_score < $h_handicap_score}
										{$a_handicap_class = "predict_success"}
									{else}
										{$h_handicap_class = "predict_draw"}
										{$a_handicap_class = "predict_draw"}
									{/if}
								{/if}

								{* Total *}
								{if isset($detail['total'])}
									{assign var=over_total_class value="predict_fail"}
									{assign var=under_total_class value="predict_fail"}
									{if $a_score + $h_score > $detail['total']['point']}
										{$over_total_class = "predict_success"}
									{else if $a_score + $h_score < $detail['total']['point']}
										{$under_total_class = "predict_success"}
									{else}
										{$over_total_class = "predict_draw"}
										{$under_total_class = "predict_draw"}
									{/if}
								{/if}

								{* Single *}
								{if isset($detail['single'])}
									{assign var=a_single_class value="predict_fail"}
									{assign var=h_single_class value="predict_fail"}
									{if $a_score > $h_score}
										{$a_single_class = "predict_success"}
									{else if $a_score < $h_score}
										{$h_single_class = "predict_success"}
									{else}
										{$a_single_class = "predict_draw"}
										{$h_single_class = "predict_draw"}
									{/if}
								{/if}

								{* One lose Two win *}
								{if isset($detail['one_lose_two_win'])}
									{assign var=a_one_lose_two_win_class value="predict_fail"}
									{assign var=h_one_lose_two_win_class value="predict_fail"}
									{assign var=one_lose_two_win value=$detail['one_lose_two_win']}
									{assign var=a_one_lose_two_win_score value=$a_score}
									{if isset($one_lose_two_win['a_spread'])}{$a_one_lose_two_win_score = $a_one_lose_two_win_score + $one_lose_two_win['a_spread']}{/if}
									{assign var=h_one_lose_two_win_score value=$h_score}
									{if isset($one_lose_two_win['h_spread'])}{$h_one_lose_two_win_score = $h_one_lose_two_win_score + $one_lose_two_win['h_spread']}{/if}
									{if $a_one_lose_two_win_score > $h_one_lose_two_win_score}
										{$a_one_lose_two_win_class = "predict_success"}
									{else if $a_one_lose_two_win_score < $h_one_lose_two_win_score}
										{$h_one_lose_two_win_class = "predict_success"}
									{else}
										{$a_one_lose_two_win_class = "predict_draw"}
										{$h_one_lose_two_win_class = "predict_draw"}
									{/if}
								{/if}

								{* Odd Even *}
								{if isset($detail['odd_even'])}
									{assign var=odd_class value="predict_fail"}
									{assign var=even_class value="predict_fail"}
									{if ($a_score + $h_score) % 2 == 1}
										{$odd_class = "predict_success"}
									{else if ($a_score + $h_score) % 2 == 0}
										{$even_class = "predict_success"}
									{else}
										{$odd_class = "predict_draw"}
										{$even_class = "predict_draw"}
									{/if}
								{/if}

								{* end *}

								<!-- Away Team -->
								<tr>
									<td rowspan='2' style="background-color: {$nowColor};">
										<span class='lead'>{$row['id']}</span>
										<br>
										{$row['game_datetime']|date_format:"%m\%d %H:%M"}
										<br>
										<a href='#'>對戰資訊</a>
									</td>
									<td  style="background-color: {$nowColor};">{$row['a_name']} <strong class="float-right {if $a_score > $h_score}text-success{else if $a_score < $h_score}text-danger{/if}">{$row['a_score']}</strong></td>
									{foreach from=$names item=name}

										{if $name == '讓分'}
											<td class='{$a_handicap_class}'>
												客 {if isset($detail['handicap']['a_spread'])}{$detail['handicap']['a_spread']}{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['handicap']['a_odds']}</span>
											</td>
										{else if $name == '大小'}
											<td class='{$over_total_class}'>
												大 {$detail['total']['point']}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['total']['over_odds']}</span>
											</td>
										{else if $name == '獨贏'}
											<td class='{$a_single_class}'>
												客
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['single']['a_odds']}</span>
											</td>
										{else if $name == '一輸二贏'}
											<td class='{$a_one_lose_two_win_class}'>
												{if isset($detail['one_lose_two_win']['a_spread'])}一輸{else}&nbsp;{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['one_lose_two_win']['a_odds']}</span>
											</td>
										{else if $name == '單雙'}
											<td class='{$odd_class}'>
												單
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['odd_even']['odd_odds']}</span>
											</td>
										{/if}
									{/foreach}
								</tr>
								<!-- Away Team -->
								<!-- Home Team -->
								<tr>
									<td style="background-color: {$nowColor};">{$row['h_name']} <strong class="float-right {if $a_score < $h_score}text-success{else if $a_score > $h_score}text-danger{/if}">{$row['h_score']}</strong></td>
									{foreach from=$names item=name}
										{if $name == '讓分'}
											<td class='{$h_handicap_class}'>
												主 {if isset($detail['handicap']['h_spread'])}{$detail['handicap']['h_spread']}{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['handicap']['h_odds']}</span>
											</td>
										{else if $name == '大小'}
											<td class='{$under_total_class}'>
												小
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['total']['under_odds']}</span>
											</td>
										{else if $name == '獨贏'}
											<td class='{$h_single_class}'>
												主
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['single']['h_odds']}</span>
											</td>
										{else if $name == '一輸二贏'}
											<td class='{$h_one_lose_two_win_class}'>
												{if isset($detail['one_lose_two_win']['h_spread'])}一輸{else}&nbsp;{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['one_lose_two_win']['h_odds']}</span>
											</td>
										{else if $name == '單雙'}
											<td class='{$even_class}'>
												雙
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['odd_even']['even_odds']}</span>
											</td>
										{/if}
									{/foreach}
								</tr>
								<!-- Home Team -->
							{/foreach}
						{/if}
					</tbody>
				</table>
			</div>
		</div>
	</div>
{/block}