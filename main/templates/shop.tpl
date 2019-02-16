{extends file='route.tpl'}
{block name='plugin'}
	<link rel='stylesheet' type='text/css' href='stylesheets/shop-style.css'>
{/block}
{block name='body'}
	<div class='container'>
		<div class='row'>
			<div class='col-lg-6 offset-lg-3'>
				<div class='section_title text-center'>
					商城
				</div>
			</div>
		</div>
		<div class='row mt-3'>
			<div class='col'>
				<div class='page_nav'>
					<ul class='nav d-flex flex-row align-items-start justify-content-center'>
						{foreach from=$categories item=category name=loop}
							<li class='tab_link{if $smarty.foreach.loop.index == 0} active{/if}'>
								<a onclick="changeTab(event, '{$category['e_name']}')">{$category['name']}</a>
							</li>
						{/foreach}				
					</ul>
				</div>
			</div>
		</div>

		<div class='row m-3'>
			{foreach from=$categories item=category name=loop}
				<div class='tab_content' id="{$category['e_name']}" style='display: {if $smarty.foreach.loop.index == 1}block{else}none{/if}'>
					<div class='row'>
						{foreach from=$products item=product}
						{if $product['category_id'] == $category['id']}
							<div class='col-xl-4 col-lg-6'>
								<div class='card mb-3'>
									<img class='card-img-top w-100' src="{$product['image_url']}" />
									<div class='card-body product_content'>
										<div>
											<div class='product_info d-flex flex-row align-itmes-start justify-content-center'>
												<div class='product_name'>
													<a href='#'>{$product['name']}</a>
												</div>
												<div class='product_category'>
													<a href='#'>{$category['name']}</a>
												</div>
											</div>
										</div>
										<div class='ml-auto text-right'>
											<div class='product_price'>
												NTD: {$product['price']}
											</div>
										</div>
									</div>
								</div>
							</div>
						{/if}
						{/foreach}
					</div>
				</div>
			{/foreach}
		</div>

		{literal}
		<script>
			function changeTab(event, tabId) {
				var tab_contents, tab_links;
				tab_contents = document.getElementsByClassName('tab_content');
				for (let i = 0; i < tab_contents.length; i++)
					tab_contents[i].style.display = 'none';
				tab_links = document.getElementsByClassName('tab_link');
				for (let i = 0; i < tab_links.length; i++)
					tab_links[i].className = tab_links[i].className.replace(' active', '');
				document.getElementById(tabId).style.display = 'block';
				event.target.parentNode.className += ' active';
				// console.log(event.target.parentNode);
			}
		</script>
		{/literal}
	</div>
{/block}