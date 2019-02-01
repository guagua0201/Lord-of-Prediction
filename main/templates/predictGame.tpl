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
	</div>
{/block}