{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		{if $success}
			<h3>Thank You!</h3>
			<p>Your Account Is Now Activate</p>
		{else}
			<h3>Error</h3>
			<p>We encountered some problems while activating your account.</p>
		{/if}
	</div>
{/block}