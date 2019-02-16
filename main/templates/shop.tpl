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
						<li>
							<a class='tablink active' href='#' onclick="changeTab(event, 'hairstyles')">髮型</a>
						</li>
						<li>
							<a class='tablink' href='#' onclick="changeTab(event, 'clothes')">衣服</a>
						</li>
						<li>
							<a class='tablink' href='#' onclick="changeTab(event, 'shoes')">鞋子</a>
						</li>					
					</ul>
				</div>
			</div>
		</div>

		<div class='row mt-3'>
			<div class='tabcontent' id='hairstyles' style='display: block'>
				<div class='row'>
					{for $i=0 to 10}
						<div class='col-xl-4 col-lg-6'>
							<div class='card'>
								<img class='card-img-top w-100' src='images/product/test.png' />
								<div class='card-body product_content'>
									<div class='product_info d-flex flex-row align-items-start justify-content-center'>
										<div>
											<div class='product_name'>
												<!-- {$row['name']} -->
												<a href='#'>黑色高跟鞋</a>
											</div>
											<div class='product_category'>
												<!-- {$row['category_name']} -->
												<a href='#'>鞋子</a>
											</div>
										</div>
										<div class='ml-auto text-right'>
											<div class='product_price text-right'>
												<!-- NTD: {$row['price']} -->
												NTD: 300
											</div>
										</div>
										<!-- <div class='product_buttons'>
											
										</div> -->
									</div>
								</div>
							</div>
						</div>
					{/for}
				</div>
			</div>
			<div class='tabcontent' id='clothes' style='display: none'>
				<div class='col-xl-4 col-lg-6'>
					clothes
				</div>
			</div>

			<div class='tabcontent' id='shoes' style='display: none'>
				<div class='col-xl-4 col-lg-6'>
					shoes
				</div>
			</div>
		</div>


		{literal}
		<script>
			function changeTab(event, tabId) {
				var tabcontents, tablinks;
				tabcontents = document.getElementsByClassName('tabcontent');
				for (let i = 0; i < tabcontents.length; i++)
					tabcontents[i].style.display = 'none';
				tablinks = document.getElementsByClassName('tablink');
				for (let i = 0; i < tablinks.length; i++)
					tablinks[i].className = tablinks[i].className.replace(' active', '');
				document.getElementById(tabId).style.display = 'block';
				event.currentTarget.className += ' active';
			}
		</script>
		{/literal}
	</div>
{/block}