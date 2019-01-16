{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<h2>聯絡我們</h2>
		<p>請將問題或建議告訴我們，並留下正確聯絡方式，我們將儘速回覆您，謝謝！</p>
		<form method='POST' action=''>
			<div class='input-group mb-3 input-group-lg'>
				<div class="input-group-prepend">
					<span class="input-group-text">帳號:</span>
				</div>
				{if $log_status != 0}
					<input type='text' id='username' name='username' value='{$member}' class='form-control form-control-lg' />
				{else}
					<input type='text' id='username' name='username' class='form-control form-control-lg' />
				{/if}
			</div>
			<div class='input-group mb-3 input-group-lg'>
				<div class="input-group-prepend">
					<span class="input-group-text">信箱:</span>
				</div>
				{if $log_status != 0}
					<input type='text' id='username' name='username' value='{$email}' class='form-control form-control-lg' />
				{else}
					<input type='text' id='username' name='username' class='form-control form-control-lg' />
				{/if}
			</div>
			<div class='input-group mb-3 input-group-lg'>
				<div class="input-group-prepend">
					<span class="input-group-text">想說的事:</span>
				</div>
				<textarea rows='9' id='content' name='content' class='form-control form-control-lg'></textarea>
			</div>
			<div>
				<input type='hidden' name='submit' value='submit' />
				<button type='submit' class='btn btn-outline-dark btn-lg float-right w-25'>送出</button>
			</div>
		</form>
		<h4 class='text-secondary' style='clear: right; margin-top: 90px'>客服電話: 02-12345678&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;客服信箱: prophecyking@gmail.com</h4>
	</div>
{/block}