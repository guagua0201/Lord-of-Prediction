{extends file='route.tpl'}
{block name='body'}
	<div style='min-height: 68vh; padding: 30px' class='jumborton'>
		<table class='table table-bordered table-striped table-sm'>
			<tbody>
				{foreach from=$data item=row}
					<tr>
						{foreach from=$row item=item}
							<td>{$item}</td>
						{/foreach}
					</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
{/block}