{extends file='route.tpl'}
{block name='plugin'}
	{literal}
	<script>
		$(document).ready(function() {
			$('.card-header').bind('click', function() {
				$("#btn" + $(this).attr('id')).click();
			});
		});
	</script>
	{/literal}
{/block}
{block name='body'}
	<div class='container'>
		{foreach from=$classes item=class name=loop}
			<div class='card mb-5'>
				<div style='display: none'>
					<a class='card-link text-light font-weight-bold align-middle' data-toggle='collapse' href='#collapse{$smarty.foreach.loop.index}'>
						<button id='btn{$smarty.foreach.loop.index}'></button>
					</a>
				</div>
				<div class='card-header bg-info lead' id='{$smarty.foreach.loop.index}'>
					<div class='float-right'>
						<a href="addCategory.php?class_id={$class['id']}">
							<button class='btn btn-outline-light'>
								<i class='fa fa-plus' aria-hidden='true'></i>
							</button>
						</a>
						<a href="editClass.php?class_id={$class['id']}">
							<button class='btn btn-outline-light'>
								<i class='fa fa-pencil' aria-hidden='true'></i>
							</button>
						</a>
						<a href="deleteClass.php?class_id={$class['id']}">
							<button class='btn btn-outline-light'>
								<i class='fa fa-trash' aria-hidden='true'></i>
							</button>
						</a>
					</div>
					<a class='card-link text-light font-weight-bold align-middle' data-toggle='collapse' href='#collapse{$smarty.foreach.loop.index}'>
						{$class['name']}
					</a>
				</div>
				<div id='collapse{$smarty.foreach.loop.index}' class='collapse' data-parent='#accordation'>
					<div class='table-responsive'>
						<table class='table'>
							<thead class='lead bg-info text-light'>
								<tr>
									<td class='col-md-3'>分類名稱</td>
									<td class='col-md-7'>分類描述</td>
									<td class='col-md-2'></td>
								</tr>
							</thead>
							<tbody>
								{foreach from=$categories item=category}
									{if $category['class_id'] == $class['id']}
										<tr>
											<td class='font-weight-bold'>{$category['name']}</td>
											<td>{$category['description']}</td>
											<td class='text-center'>
												<a class='mr-3' href="editCategory.php?category_id={$category['id']}">
													<button class='btn btn-outline-secondary'>
														<i class='fa fa-pencil' aria-hidden='true'></i>
													</button>
												</a>
												<a class='ml-3' href="deleteCategory.php?category_id={$category['id']}">
													<button class='btn btn-outline-secondary'>
														<i class='fa fa-trash' aria-hidden='true'></i>
													</button>
												</a>
											</td>
										</tr>
									{/if}
								{/foreach}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
{/block}