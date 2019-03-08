{extends file='route.tpl'}
{block name='body'}
	<div class='container'>
		{foreach from=$classes item=class}
			<div class='row'>
				<div class='table-responsive'>
					<h3>{$class['name']}</h3>
					<table class='table table-bordered'>
						<thead class='lead bg-dark font-weight-bold text-light'>
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
		{/foreach}
	</div>
{/block}