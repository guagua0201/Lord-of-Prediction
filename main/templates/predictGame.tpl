{extends file='route.tpl'}
{block name='plugin'}
{literal}
<script>
	$(document).ready(function() {
		$('.check-td').click(function() {
			var box = $(this).children().children('input');
			if (!box.is(':checked')) {
				var group = "input:checkbox[name='" + box.attr('name') + "']";
				$(group).prop('checked', false);
				box.prop('checked', true);
				$(group).parent().parent('td').each(function() {
					$(this).css({ 'background-color' : 'white' });
				});
				$(this).css({ 'background-color' : 'rgb(252, 133, 133)'});
			} else {
				box.prop('checked', false);
				$(this).css({ 'background-color' : 'white' });
			}
		});
		$("input[type='checkbox']").click(function(e) {
			e.stopPropagation();
			if ($(this).is(':checked')) {
				var group = "input:checkbox[name='" + $(this).attr('name') + "']";
				$(this).prop('checked', true);
				$(group).parent().parent('td').each(function() {
					$(this).css({ 'background-color' : 'white' });
				});
				$(this).parent().parent('td').css({ 'background-color' : 'rgb(252, 133, 133)'});
			} else {
				$(this).prop('checked', false);
				$(this).parent().parent('td').css({ 'background-color' : 'white' });
			}
		});
		$('.check-td').mouseenter(function() {
			var box = $(this).children().children('input');
			if (!box.is(':checked'))
				$(this).css({ 'background-color' : 'rgb(198, 198, 198)' });
		});
		$('.check-td').mouseleave(function() {
			var box = $(this).children().children('input');
			if (!box.is(':checked') || $(this).css('background-color') == "rgb(198, 198, 198)")
				$(this).css({ 'background-color': 'white' });
		});
	});
</script>
{/literal}
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row border p-2'>
			<div class='col-md-9'>
				<div class='row h-100 align-items-center'>
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
			</div>
			<div class='col-md-3'>
				<div class='row'>
					<div class='offset-md-3 col-md-9' style='border-left: solid 0.5px gray'>
						<div class='row pl-3'>
							日期
						</div>
						<div class='row pl-3 justify-content-between'>
							<a class='text-secondary text-center border p-1' href='#'>
								<p style='margin-bottom: 0'>{$yesterday|date_format:"%m/%d"}</p>
								<strong>星期{$yesterday|date_format:"%a"}</strong>
							</a>
							<a class='text-secondary text-center border p-1' href='#'>
								<p style='margin-bottom: 0'>{$smarty.now|date_format:"%m/%d"}</p>
								<strong>星期{$smarty.now|date_format:"%a"}</strong>
							</a>
							<a class='text-secondary text-center border p-1' href='#'>
								<p style='margin-bottom: 0'>{$tomorrow|date_format:"%m/%d"}</p>
								<strong>星期{$tomorrow|date_format:"%a"}</strong>
							</a>
						</div>
					</div>
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
						<!-- {literal}
						<script>
							$(document).ready(function() {
								$('input:checkbox').click(function(element) {
									var box = $(this);
									var td = element.target.parentElement.parentElement.parentElement;
									if (box.is(':checked')) {
										var group = "input:checkbox[name='" + box.attr('name') + "']";
										$(group).prop('checked', false);
										var p = $(group).closest('td');
									//	console.log(p);
										box.prop('checked', true);
										for (let index = 0; index < p.length; index++)
											p[index.toString()].className = '';
										td.className = 'bg-info';
									} else {
										box.prop('checked', false);
										td.className = '';
									}
								});
							});
						</script>
						<style>
							span.float-right {
								font-color: #bdbdbd;
								font-size: 0.9em;
							}
						</style>
						{/literal} -->
						<form id='predictForm' method='POST' action='predictGame.php'>
							{if count($data) == 0}
								<tr class='text-center'>
									<td colspan='5'>暫無資料</td>
								</tr>
							{else}
							<input name='submit' value='submit' hidden />
							<input name='data_size' value='{count($data)}' hidden />
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
											<td class='check-td'>
												<div class='form-check'>
													<input class='form-check-input' type='checkbox' name="a-{$row['id']}" value='a'/>
													客 {if isset($detail['handicap']['a_spread'])}{$detail['handicap']['a_spread']}{/if}
													<span class='float-right'>{$detail['handicap']['a_odds']}</span>
												</div>
											</td>
										{else if $name == '大小'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="b-{$row['id']}" value='b'/>
														大 {$detail['total']['point']}
													<span class='float-right'>{$detail['total']['over_odds']}</span>
												</div>
											</td>
										{else if $name == '獨贏'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="c-{$row['id']}" value='c'/>
														客
													<span class='float-right'>{$detail['single']['a_odds']}</span>
												</div>
											</td>
										{else if $name == '一輸二贏'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="d-{$row['id']}" value='d'/>
														{if isset($detail['one_lose_two_win']['a_spread'])}一輸{else}&nbsp;{/if}
													<span class='float-right'>{$detail['one_lose_two_win']['a_odds']}</span>
												</div>
											</td>
										{else if $name == '單雙'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="e-{$row['id']}" value='e'/>
														單
													<span class='float-right'>{$detail['odd_even']['odd_odds']}</span>
												</div>
											</td>
										{/if}
									{/foreach}
								</tr>
								<tr>
									<td>{$row['h_name']}</td>
									{foreach from=$names item=name}
										{assign var=detail value=$row['details']}
										{if $name == '讓分'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="a-{$row['id']}" value='A'/>
														主 {if isset($detail['handicap']['h_spread'])}{$detail['handicap']['h_spread']}{/if}
													<span class='float-right'>{$detail['handicap']['h_odds']}</span>
												</div>
											</td>
										{else if $name == '大小'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="b-{$row['id']}" value='B'/>
														小
													<span class='float-right'>{$detail['total']['under_odds']}</span>
												</div>
											</td>
										{else if $name == '獨贏'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="c-{$row['id']}" value='C'/>
														主
													<span class='float-right'>{$detail['single']['h_odds']}</span>
												</div>
											</td>
										{else if $name == '一輸二贏'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="d-{$row['id']}" value='D'/>
														{if isset($detail['one_lose_two_win']['h_spread'])}一輸{else}&nbsp;{/if}
													<span class='float-right'>{$detail['one_lose_two_win']['h_odds']}</span>
												</div>
											</td>
										{else if $name == '單雙'}
											<td class='check-td'>
												<div class='form-check'>
														<input class='form-check-input' type='checkbox' name="e-{$row['id']}" value='E'/>
														雙
													<span class='float-right'>{$detail['odd_even']['even_odds']}</span>
												</div>
											</td>
										{/if}
									{/foreach}
								</tr>
							{/foreach}
							{/if}
						</form>
					</tbody>
					<tfoot>
						<tr>
							<td class='text-center' colspan='{if count($data) == 0}5{else}{count($names)+2}{/if}'>
								<button class='btn w-25' type='submit' form='predictForm'><strong>送出預測</strong></button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
{/block}