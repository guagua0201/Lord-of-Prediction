<div style='min-height: 25vh'>
	<div style='background-color: #080808; height: 150px; padding: 15px 0' class='jumborton'>
		<div style='width: 100%' class='row'>
			<div class='col-sm-10'>
				<a href='/' title='Home'>
					<img src='/images/logo.jpg' height='100%' width='200px' />
				</a>
			</div>
			<div class='col-sm-1'>
				<table style='line-height: 25px'>
					<tr>
						<td>
							{if $log_status != 0}
								<a href='/' title='Profile'>{$member}</a>
							{else}
								<a href='/login.php' title='Login'>登入</a>
							{/if}
						</td>
					</tr>
					<tr>
						<td>
							{if $log_status == 0}
								<a href='/register.php' title='Register'>註冊</a>
							{else}
								<a href='/logout.php' title='Logout'>登出</a>
							{/if}
						</td>
					</tr>
					<tr>
						<td>
							<a href='/' title='Contact'>連繫客服</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href='/' title='Shop'>商城入口</a>
						</td>
					</tr>
				</table>
			</div>
			<div class='col-sm-1'>
				<table style='line-height: 25px'>
					{if $log_status != 0}
						<tr>
							<td>
								<a href='/profile.php' title='Profile'>個人小屋</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='StoreValue'>儲值入口</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='ShoppingCar'>購物車</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='Message'>訊息中心</a>
							</td>
						</tr>
					{/if}
				</table>
			</div>
		</div>
	</div>

	<nav style="margin-bottom: 20px; padding: 10px 30px;" class="navbar bg-dark navbar-dark navbar-expand-sm">
	  <ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="/predictGame.php?category_id=4">預測賽事</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/searchArticle.php">討論區</a>
		</li>
		<li class="nav-item active dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">小遊戲</a>
			<div class='dropdown-menu'>
				<a class='dropdown-item' href='/BeiJingCart.php'>北京賽車</a>
				<a class='dropdown-item' href='/lotteryGame.php'>彩票</a>
				<a class='dropdown-item' href='/baccaratGame.php'>百家樂</a>
			</div>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/">找高手</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/">即時比分</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/searchUser.php">用戶搜尋</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="./">歷史數據</a>
		</li>
	  </ul>
	</nav>
</div>