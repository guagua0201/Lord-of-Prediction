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
										<a class='pr-3' href="searchArticle.php?category_id={$category['id']}">{$category['name']}</a>
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
								<td class='col-md-7 align-middle' colspan='3'>運彩盤</td>
							</div>
						</tr>
						<tr>
							<div class='row'>
								<td class='text-center align-middle'>讓分</td>
								<td class='text-center align-middle'>不讓分</td>
								<td class='text-center align-middle'>大小</td>
							</div>
						</tr>
					</thead>
					<tbody>
						{literal}
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
											p[index.toString()].className = 'form-check';
										td.className = 'form-check bg-info';
									} else {
										box.prop('checked', false);
										td.className = 'form-check';
									}
								});
							});
						</script>
						{/literal}
						<form id='predictForm' method='POST' action='predictGame.php'>
							{if count($name) == 0}
								<tr class='text-center'>
									<td colspan='5'>暫無資料</td> <!-- colspan wait for fixed -->
								</tr>
							{else}
								{foreach from=$data item=row name=loop}
									<input name='' value='' hidden />
									<tr>									
										<td rowspan='2'>
											<span class='lead'>{$row[0]|substr:12}</span><br />{$row[1]} {$row[2]}
											<a href='#'>對戰資訊</a>
										</td>
										<td>{$row[3]}</td>
										{for $foo=5 to count($row)-1}
											<td>
												<div class='form-check'>
													<label class='form-check-label'>
														<input type='checkbox' class='form-check-input' name='{$name[$foo]}{$smarty.foreach.loop.index}' />
														{if $name[$foo] == 'a' || $name[$foo] == 'b'}
															客
														{else if $name[$foo] == 'c'}
															大
														{/if}
													</label>
												</div>
											</td>
										{/for}
									</tr>
									<tr>
										<td>{$row[4]}</td>
										{for $foo=5 to count($row)-1}
											<td>
												<div class='form-check'>
													<label class='form-check-label'>
														<input type='checkbox' class='form-check-input' name='{$name[$foo]}{$smarty.foreach.loop.index}' />
														{if $name[$foo] == 'a'}
															主 {$row[$foo]}
														{else if $name[$foo] == 'b'}
															主
														{else if $name[$foo] == 'c'}
															小 {$row[$foo]}
														{/if}
													</label>
												</div>
											</td>
										{/for}
									</tr>
								{/foreach}
							{/if}
						</form>
					</tbody>
					<tfoot>
						<tr>
							<td class='text-center' colspan='5'> <!-- colspan wait for fixed -->
								<button class='btn w-25' type='submit' form='predictForm'><strong>送出預測</strong></button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
{/block}