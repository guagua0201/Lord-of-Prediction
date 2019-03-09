{extends file='route.tpl'}
{block name='plugin'}
	{literal}
	<script>
		function next_step() {
			/* Do Some Validation Check */
			$("#edit_category_form").submit();
		}
	</script>
	{/literal}
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<form id='edit_category_form' method='POST' action="editCategory.php?category_id={$smarty.get.category_id}">
			<input name='edit_category_submit' value='edit_category_submit' hidden>
			<div class='input-group input-group-lg mt-5 mb-5'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>組別名稱:</span>
				</div>
				<input type='text' class='form-control' name='class_name' value="{$category['class_name']}" readonly>
			</div>
			<div class='input-group input-group-lg mb-5'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>ID:</span>
				</div>
				<input type='text' class='form-control' name='id' value="{$category['id']}" readonly>
			</div>
			<div class='input-group input-group-lg mb-5'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>分類名稱:</span>
				</div>
				<input type='text' class='form-control' name='name' value="{$category['name']}">
			</div>
			<div class='input-group input-group-lg mb-5'>
				<div class='input-group-prepend'>
					 <span class='input-group-text'>分類描述:</span>
				</div>
				<input type='text' class='form-control' name='description' value="{$category['description']}">
			</div>
		</form>
		<div class='row justify-content-end'>
			<button class='m-3 btn btn-lg btn-secondary' onclick="history.go(-1);" = 'listCategory.php';">上一頁</button>
			<button class='m-3 btn btn-lg btn-primary' onclick="next_step();">確認修改</button>
		</div>
	</div>
{/block}