{extends file='route.tpl'}
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
				<table class='table table-bordered table-hover table-striped'>
					<thead class='thead-dark text-center font-weight-bold'>
						<tr>
							<div class='row'>
								<td class='col-md-1 align-middle' rowspan='2'>賽事資訊</td>
								<td class='col-md-2 align-middle' rowspan='2'>球隊資訊</td>
								<td class='col-md-7 align-middle' colspan='{count($names)-2}'>運彩盤</td>
							</div>
						</tr>
						<tr>
							<div class='row'>
								{foreach from=$names item=name}
									{if $name != '主客隊' && $name != '比賽時間'}
										<td class='text-center align-middle'>{$name}</td>
									{/if}
								{/foreach}
							</div>
						</tr>
					</thead>

					<tbody>
						<form id='predictForm' method='POST' action='predictGame.php'>
							{foreach from=$data item=row}
								<tr>
									<td rowspan='2'>
										<span class='lead'>1234</span><br />{$row[$indexes['比賽時間']]} {$row[$indexes['比賽時間'] + 1]}
										<a href='#'>對戰資訊</a>
									</td>
									<td>{$row[$indexes['主客隊']]}</td>
									{foreach from=$names item=name}
										{assign var = 'index' value = $indexes[$name]}
										{if $name == '讓分'}
											<td>
												<div class='form-check'>
													<label class='form-check-label'>
														<input class='form-check-input' type='checkbox' name='' />
														客 {$row[$index]} {$row[$index + 2]}
													</label>
												</div>
											</td>
										{else}
										{/if}
									{/foreach}
								</tr>
								<tr>
									<td>{$row[$indexes['主客隊'] + 1]}</td>
									{foreach from=$names item=name}
										{assign var = 'index' value = $indexes[$name]}
										{if $name == '讓分'}
											<td>
												<div class='form-check'>
													<label class='form-check-label'>
														<input class='form-check-input' type='checkbox' name='' />
														 主 {$row[$index + 1]} {$row[$index + 3]}
													</label>
												</div>
											</td>
										{/if}
									{/foreach}
								</tr>
							{/foreach}
						</form>
					</tbody>
					
					<tfoot>
						<tr>
							<td class='text-center' colspan='{count($names)}'> <!-- colspan wait for fixed -->
								<button class='btn w-25' type='submit' form='predictForm'><strong>送出預測</strong></button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
{/block}