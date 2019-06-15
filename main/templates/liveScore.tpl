{extends file='route.tpl'}
{block name='body'}
	
	<div class="container" style="margin-left:auto; margin-right:auto;">
	{$gameCount=0}
	{foreach $baseballAll as $nowGame}

		{if $gameCount%2 == 0}
			<div class="row" style="padding-top: 30px">
		{/if}

		<div class="col-6">
			{if $nowGame["start"] == "1"}
			<div class="row">
				<p style="margin:auto; font-size:40px ;color: #3399CC; font-weight: 600;">
					{$nowGame["teamHighlight"]}
				</p>
				
			</div>
				
			<div class="row">
				<p style="margin:auto ;">
					{if $nowGame["data-aheadprice"] > 0}
						{$nowGame["data-aheadprice"]}分贏{$nowGame["data-aheadodds"]}%
					{else}
						{-$nowGame["data-aheadprice"]}分輸{$nowGame["data-aheadodds"]}%
					{/if}
					
				</p>
			</div>
			{else}
			<div class="row">
				<p style="margin:auto; font-size:40px; color: #BBBBBB; font-weight: 600;">
					即將開始
				</p>
			</div>
			<div class="row">
				<p style="margin:auto;">
					{$nowGame["startTime"]}
				</p>
			</div>

			{/if}

			<div class = "row">
				<div class="col-4" style="text-align:center; font-size:30px;">
				{$nowGame["data-namea"]} <!--<br/>{$nowGame["a-score"]}-->
				<br/>
				{if $nowGame["start"] == "1"}
					{$nowGame["a-score"]}
				{else}
					<br/>
				{/if}
				</div>
				<div class="col-4 " style="text-align:center;">

				{if $nowGame["start"] == "1"}
					<img src="/images/liveScore/baseball/{$nowGame["baseState"]}.png" style="height:100%; weight:100%"></img>
				{else}
					<img src="/images/liveScore/baseball/0.png" style="height:100%; weight:100%"></img>
				{/if}
				
				</div>
				<div class="col-4 " style="text-align:center; font-size:30px;">
				{$nowGame["data-nameh"]} <!--<br/>{$nowGame["h-score"]}-->
				<br/>
				{if $nowGame["start"] == "1"}
					{$nowGame["h-score"]}
				{else}
					<br/>
				{/if}

				</div>
			</div>
			<div class = "row" style="padding-top: 10px">
				<div class="col"  style="text-align:center;">
					{if $nowGame["start"] == "1"}

						{assign var="innNum" value=count($nowGame['a_score'])}
						{if $innNum >= 9 && count($nowGame['a_score']) == count($nowGame['h_score'])}
							{assign var="innNum" value=$innNum+1}
						{/if}
						{if $innNum < 9}
							{assign var="innNum" value=9}
						{/if}	
					{else}
						{assign var="innNum" value=9}
					{/if}
					
					<table class="scoreTable" style="margin:auto ;border:3px #cccccc solid;" cellpadding="1" border="1">
						<tbody>
							<tr>
								<td width="70"></td>
								{for $i=0 to $innNum-1}
									<td width="25">
										{$i+1}
									</td>
								{/for}
								<td width="25"></td>
								<td width="25" style="background: #FFFF66;">R</td>
								<td width="25" style="background: #FFFF66;">H</td>
								<td width="25" style="background: #FFFF66;">E</td>
							</tr>
							<tr>
								<td width="70">{$nowGame['data-namea']}</td>
								{for $i=0 to $innNum-1}
									<td width="25" style="background: #FFFFCC;">
									{if $nowGame["start"] == 1 && count($nowGame["a_score"]) > $i }
										{$nowGame["a_score"][$i]}
									{/if}
									</td>
								{/for}


								<td width="25" style="background: #FFFFCC;"></td>
								{if $nowGame["start"] == 1}
									<td width="25" style="background: #FFFFCC;">{$nowGame["asr"]}</td>
									<td width="25" style="background: #FFFFCC;">{$nowGame["ash"]}</td>
									<td width="25" style="background: #FFFFCC;">{$nowGame["ase"]}</td>
								{else}
									<td width="25" style="background: #FFFFCC;"></td>
									<td width="25" style="background: #FFFFCC;"></td>
									<td width="25" style="background: #FFFFCC;"></td>
								{/if}
								
							</tr>
							<tr>
								<td width="70">{$nowGame['data-nameh']}</td>
								{for $i=0 to $innNum-1}
									<td width="25" style="background: #FFFFCC;">
									{if $nowGame["start"] == 1 && count($nowGame["h_score"]) > $i }
										{$nowGame["h_score"][$i]}
									{/if}
									</td>
								{/for}
								<td width="25" style="background: #FFFFCC;"></td>
								{if $nowGame["start"] == 1}
									<td width="25" style="background: #FFFFCC;">{$nowGame["hsr"]}</td>
									<td width="25" style="background: #FFFFCC;">{$nowGame["hsr"]}</td>
									<td width="25" style="background: #FFFFCC;">{$nowGame["hsr"]}</td>
								{else}
									<td width="25" style="background: #FFFFCC;"></td>
									<td width="25" style="background: #FFFFCC;"></td>
									<td width="25" style="background: #FFFFCC;"></td>
								{/if}
							</tr>
						</tbody>
					</table>




				</div>
			</div>

<!--		<p style="text-align: center;">
		{$nowGame["data-namea"]} {$nowGame["data-nameh"]}
		{if $nowGame["start"] == "1"}
		start
		{else}
		not start
		{/if}

		</p> -->

		</div>
		
		{if $gameCount == count($baseballAll)-1 || $gameCount%2 == 1}
			</div>
		{/if}
		{$gameCount = $gameCount+1}
		
	{/foreach}

	</div>


	{count($baseballAll)}
{/block}