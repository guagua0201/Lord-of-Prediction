{extends file='route.tpl'}
{block name='plugin'}
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
										<a class='mr-3' href="historyGame.php?category_id={$category['id']}">{$category['name']}</a>
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
						<p><input class='w-100' id='datepicker' name='date'></p>
					</form>
				</div>
			</div>
		</div>
		<div class='row mt-3'>
			<div class='table-responsive'>
				<table class='table table-bordered'>
					<thead class='thead-dark text-center font-weight-bold'>
						<tr>
							<div class='row'>
								<td class='col-md-1 align-middle' rowspan='2'>賽事資訊</td>
								<td class='col-md-2 align-middle' rowspan='2'>球隊資訊</td>
								<td class='col-md-7 align-middle' colspan='{if count($data)}{count($names)}{else}3{/if}'>運彩盤</td>
							</div>
						</tr>
						<tr>
							<div class='row'>
								{if count($data) == 0}
									<td class='text-center align-middle'>讓分</td>
									<td class='text-center align-middle'>不讓分</td>
									<td class='text-center align-middle'>大小</td>
								{else}
								{foreach from=$names item=name}
									{if $name != '主客隊' && $name != '比賽時間'}
										<td class='text-center align-middle'>{$name}</td>
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
							{foreach from=$data item=row name=loop}
								<tr>
									<td rowspan='2'>
										<span class='lead'>{$row['id']}</span>
										<br>
										{$row['game_datetime']|date_format:"%m\%d %H:%M"}
										<br>
										<a href='#'>對戰資訊</a>
									</td>
									<td>{$row['a_name']}</td>
									{foreach from=$names item=name}
										{assign var=detail value=$row['details']}
										{if $name == '讓分'}
											<td>
												客 {if isset($detail['handicap']['a_spread'])}{$detail['handicap']['a_spread']}{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['handicap']['a_odds']}</span>
											</td>
										{else if $name == '大小'}
											<td>
												大 {$detail['total']['point']}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['total']['over_odds']}</span>
											</td>
										{else if $name == '獨贏'}
											<td>
												客
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['single']['a_odds']}</span>
											</td>
										{else if $name == '一輸二贏'}
											<td>
												{if isset($detail['one_lose_two_win']['a_spread'])}一輸{else}&nbsp;{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['one_lose_two_win']['a_odds']}</span>
											</td>
										{else if $name == '單雙'}
											<td>
												單
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['odd_even']['odd_odds']}</span>
											</td>
										{/if}
									{/foreach}
								</tr>
								<tr>
									<td>{$row['h_name']}</td>
									{foreach from=$names item=name}
										{assign var=detail value=$row['details']}
										{if $name == '讓分'}
											<td>
												主 {if isset($detail['handicap']['h_spread'])}{$detail['handicap']['h_spread']}{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['handicap']['h_odds']}</span>
											</td>
										{else if $name == '大小'}
											<td>
												小
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['total']['under_odds']}</span>
											</td>
										{else if $name == '獨贏'}
											<td>
												主
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['single']['h_odds']}</span>
											</td>
										{else if $name == '一輸二贏'}
											<td>
												{if isset($detail['one_lose_two_win']['h_spread'])}一輸{else}&nbsp;{/if}
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['one_lose_two_win']['h_odds']}</span>
											</td>
										{else if $name == '單雙'}
											<td>
												雙
												<span class='float-right' style="font-color: #bdbdbd; font-size: 0.9em;">{$detail['odd_even']['even_odds']}</span>
											</td>
										{/if}
									{/foreach}
								</tr>
							{/foreach}
						{/if}
					</tbody>
				</table>
			</div>
		</div>
	</div>
{/block}