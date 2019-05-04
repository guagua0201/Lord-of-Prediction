{extends file='route.tpl'}
{block name='plugin'}
	{literal}
	<script>
		$(document).ready(function(){
			$(".card-header").bind('click', function() {
				var id = $(this).attr('id');
				$("#btn" + id).click();

				var post_data = 'id=' + id;
				var success = false;
				$.ajax({
					type: 'POST',
					url: 'readMessage.php',
					data: post_data
				});
				$(this).attr('class', 'card-header bg-secondary');
				return success;
			});
		});
	</script>
	{/literal}
{/block}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<h2>訊息中心</h2>
		<div id='accordation'>
			{if count($data) == 0}
				<h3>暫無訊息</h3>
			{else}
				{foreach from=$data item=row name=loop}
					<div style='display: none'>
						<a class='collapsed card-link text-light' data-toggle='collapse' href='#collapse{$smarty.foreach.loop.index}'>
							<button id="btn{$row['id']}"></button>
						</a>
					</div>
					<div class='card' style='font-size: 1.2em'>
						{if $row['readFlag'] == 0}
						<div id="{$row['id']}" class='card-header bg-dark'>
						{else}
						<div id="{$row['id']}" class='card-header bg-secondary'>
						{/if}
							<div class='float-right'>
								<a class='btn btn-outline-light' href="deleteMessage.php?message_id={$row['id']}">
									<i class='fa fa-trash' aria-hidden='true'></i>
								</a>
							</div>
							<a id="{$row['id']}" class='collapsed card-link text-light align-middle' data-toggle='collapse' href='#collapse{$smarty.foreach.loop.index}'>
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