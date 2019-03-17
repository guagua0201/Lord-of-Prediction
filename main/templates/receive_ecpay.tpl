{extends file='route.tpl'}
{block name='body'}
	<div class='container'>
		<p>{$smarty.post.RtnCode}</p>
		<p>{$smarty.post.RtnMsh}</p>
		<p>{$smarty.post.TradeAmt}</p>
		<p>{$smarty.post.PaymentDay}</p>
		<p>{$smarty.post.PaymentType}</p>
		<p>{$smarty.post.PaymentTypeChargeFee}</p>
		<p>{$smarty.post.SimulatePaid}</p>
		<p>{$smarty.post.TradeDate}</p>
		<p>{$smarty.post.CheckMacValue}</p>
	</div>
{/block}