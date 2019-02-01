{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<h2>訊息中心</h2>
		<div id='accordation'>
			{if count($data) == 0}
				<h3>暫無訊息</h3>
			{else}
				{literal}
				<script>
					$(document).ready(function(){
						$('.card-link').click(function(element) {
						//	console.log(element);
							var postData = 'id=' + element.target.id;
							$.ajax({
								type: 'POST',
								url: 'readMessage.php',
								data: postData,
								success: function() {
									element.target.parentElement.className = 'card-header bg-secondary';
								}
							});
							return true;
						});
					});
				</script>
				{/literal}
				{foreach from=$data item=row name=loop}
					<div class='card' style='font-size: 1.2em'>
						{if $row['readFlag'] == 0}
						<div class='card-header bg-dark'>
						{else}
						<div class='card-header bg-secondary'>
						{/if}
							<a id="{$row['id']}" class='collapsed card-link text-light' data-toggle='collapse' href='#collapse{$smarty.foreach.loop.index}'>
								{$row['subject']}
							</a>
						</div>
						<div id='collapse{$smarty.foreach.loop.index}' class='collapse' data-parent='#accordation'>
							{$row['message']}
						</div>
						<div class='card-footer bg-light'>
							From: {$row['senderNickname']} [ <a href='#'>{$row['senderUsername']}</a> ]
							<div class='float-right'>{$row['sendTime']}</div>
						</div>
					</div>
				{/foreach}
			{/if}
		</div>
	</div>
{/block}