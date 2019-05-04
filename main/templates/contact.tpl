{extends file='route.tpl'}
{block name='body'}
	<script src="../Ckeditor/ckeditor.js"></script>
	<div class='container' style='min-height: 68vh'>
		<h2>聯絡我們</h2>
		<p>請將問題或建議告訴我們，並留下正確聯絡方式，我們將儘速回覆您，謝謝！</p>
		<form method='POST' action='contact.php'>
			<div class='input-group mb-3 input-group-lg'>
				<div class="input-group-prepend">
					<span class="input-group-text">帳號:</span>
				</div>
				<input type='text' id='username' name='username' value='{$member}' class='form-control form-control-lg' readonly />
			</div>
			<div class='input-group mb-3 input-group-lg'>
				<div class="input-group-prepend">
					<span class="input-group-text">信箱:</span>
				</div>
				<input type='text' id='email' name='email' value='{$email}' class='form-control form-control-lg' readonly />
			</div>
			<div class='input-group mb-3 input-group-lg'>
				<div class='input-group-prepend'>
					<span class='input-group-text'>主題:</span>
				</div>
				<input type='text' id='subject' name='subject' class='form-control form-control-lg' />
			</div>
			<div class='form-group form-group-lg'>
				<div class="form-group-prepend">
					<span class="input-group-text">想說的事:</span>
				</div>
				<textarea rows='9' id='message' name='message' class='form-control form-control-lg'></textarea>
				<script>
					CKEDITOR.replace('message');
				</script>
				<p id='content_notice' class='alert alert-danger' hidden>請輸入內文!!</p>
			</div>
			<div>
				<input type='hidden' name='submit' value='submit' />
				<button type='submit' class='btn btn-outline-dark btn-lg float-right w-25'>送出</button>
			</div>
		</form>
		<h4 class='text-secondary' style='clear: right; margin-top: 90px'>客服電話: 02-12345678&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;客服信箱: prophecyking@gmail.com</h4>
	</div>
{/block}