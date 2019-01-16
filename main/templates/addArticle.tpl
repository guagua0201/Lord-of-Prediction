{extends file='route.tpl'}
{block name='body'}
	<script src='/javascripts/addArticle_form_check.js' type='text/javascript'></script>
	<div style='min-height: 68vh' class='container'>
		<h2>新增討論</h2>
		<form method='POST' action='addArticle.php' onsubmit="return checkForm(this);">
			<div class='form-group'>
				<label for='category'>分類</label>
				<select id='category' name='category' class='custom-select'>
					{foreach from=$data item=row}
						<option value="{$row['id']}">{$row['name']}</option>
					{/foreach}
				</select>
			</div>
			<div class='form-group'>
				<label for='title'>標題</label>
				<input type='text' id='title' name='title' class='form-control form-control-lg' />
				<p id='title_notice' class='text-danger' hidden>請輸入標題!!</p>
			</div>
			<div class='form-group'>
				<label for='content'>內文</label>
				<textarea rows='20' id='content' name='content' class='form-control form-control-lg'></textarea>
				<p id='content_notice' class='text-danger' hidden>請輸入內文!!</p>
			</div>
			<div class='form-group'>
				<button type='submit' style='width: 100%' class='btn btn-dark btn-lg'>確認</button>
				<input type='hidden' name='submit' value='submit' />
			</div>
		</form>
	</div>
{/block}