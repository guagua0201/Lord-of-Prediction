{extends file='route.tpl'}
{block name='body'}
	<script src='/javascripts/addArticle_form_check.js' type='text/javascript'></script>
	<script src="../Ckeditor/ckeditor.js"></script>
	<div style='min-height: 68vh' class='container'>
		<h2>討論修改</h2>
		<form method='POST' action="/editArticle.php?id={$article_row['id']}" onsubmit="return checkForm(this);">
			<div class='form-group'>
				<label for='category'>分類</label>
				<select id='category' name='category' class='custom-select'>
					{foreach from=$data item=row}
						{if $row['id'] == $article_row['category_id']}
							<option selected value="{$row['id']}">{$row['name']}</option>
						{else}
							<option value="{$row['id']}">{$row['name']}</option>
						{/if}
					{/foreach}
				</select>
			</div>
			<div class='form-group'>
				<label for='title'>標題</label>
				<input type='text' id='title' name='title' value="{$article_row['title']}" class='form-control form-control-lg' />
				<p id='title_notice' class='alert alert-danger' hidden>請輸入標題!!</p>
			</div>
			<div class='form-group'>
				<label for='content'>內文</label>
				<textarea rows='20' id='content' name='content' class='form-control form-control-lg'>{$article_row['content']}</textarea>
				<script>
					CKEDITOR.replace('content');
				</script>
				<p id='content_notice' class='alert alert-danger' hidden>請輸入內文!!</p>
			</div>
			<div class='form-group'>
				<input type='hidden' name='submit' value='submit' />
				<button type='submit' style='width: 100%' class='btn btn-dark btn-lg'>確認</button>
			</div>
		</form>
	</div>
{/block}