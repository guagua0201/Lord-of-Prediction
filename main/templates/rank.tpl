{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 68vh'>
		<div class='row border p-2'>
			<div class='col-md-1'>
				{foreach from=$classes item=class}
					<div class='row text-success pl-3'>
						{$class['name']}
					</div>
				{/foreach}
			</div>
			<div class='col-md-10'>
				{foreach from=$classes item=class}
					<div class='row'>
						{foreach from=$categories item=category}
							{if $category['class_id'] == $class['id']}
								<a class='mr-3' href="predictGame.php?category_id={$category['id']}">{$category['name']}</a>
							{/if}
						{/foreach}
					</div>
				{/foreach}
			</div>
		</div>
		<div class='row mt-3'>
			<div class='table-responsive'>
				<table class='table table-hover'>
					<thead class='thead-dark text-center font-weight-bold'>
						<tr>
							<div class='row'>
								<td class='border col-md-6' colspan='4'>高手榜</td>
								<td class='border col-md-6' colspan='4'>衰神榜</td>
							</div>
						</tr>
					</thead>
					<tbody>
						{for $foo = 0 to 4}
							<tr class='border'>
								<div class='row'>
									<td class='col-md-1 text-center'>
										<img src="/images/userImages/{$top_rank[$foo]['user_image']}.jpg" height="50" width="50">
									</td>
									<td class='col-md-1 text-center align-middle'>
										<a href="userProfile.php?user_id={$top_rank[$foo]['user_id']}">{$top_rank[$foo]['user_nickname']}</a>
									</td>
									<td class='col-md-2 text-center align-middle lead font-weight-bold'>
										{$top_rank[$foo]['success']}勝{$top_rank[$foo]['failure']}敗
									</td>
									<td class='col-md-2 align-middle lead font-weight-bold border-right text-success'>
										勝率 {$top_rank[$foo]['rating']} %
									</td>
									<td class='col-md-1 text-center'>
										<img src="/images/userImages/{$last_rank[$foo]['user_image']}.jpg" height="50" width="50">
									</td>
									<td class='col-md-1 text-center align-middle'>
										<a href="userProfile.php?id={$last_rank[$foo]['user_id']}">{$last_rank[$foo]['user_nickname']}</a>
									</td>
									<td class='col-md-2 text-center align-middle lead font-weight-bold'>
										{$last_rank[$foo]['success']}勝{$last_rank[$foo]['failure']}敗
									</td>
									<td class='col-md-2 align-middle lead font-weight-bold border-right text-danger'>
										勝率 {$last_rank[$foo]['rating']} %
									</td>
								</div>
							</tr>
						{/for}
					</tbody>
				</table>
			</div>
		</div>
	</div>
{/block}