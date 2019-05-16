
<div class='jumborton p-3' style='background-color: #080808'>
	<div class='row'>
		<div class='col-md-2'>
			<div class='row justify-content-center'>
				<div class='col-md-10'>
					<a href='/' title='Home'>
						<img src='/images/logo.jpg' height='100%' width='200px'/>
					</a>
				</div>
			</div>
		</div>
		<div class='col-md-10'>
			<div class='row justify-content-end'>
				<div class='col-md-2' style='max-width: 180px'>
					<table class='table table-borderless' style='line-height: 0.3em'>
						<tr>
							<td>
								{if $log_status != 0}
									<a href='/userProfile.php?user_id={$smarty.session.user_id}' title='Profile'>{$member}</a>
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
							<a href='/contact.php' title='Contact'>連繫客服</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href='/shop.php' title='Shop'>商城入口</a>
						</td>
					</tr>
					</table>
				</div>
				<div class='col-md-2' style='max-width: 180px'>
					<table class='table table-borderless' style='line-height: 0.3em'>
						{if $log_status != 0}
							<tr>
								<td>
									<a href='/profile.php' title='Profile'>個人小屋</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href='/buyCash.php?step=1' title='StoreValue'>儲值入口</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href='/showPredict.php' title='ShoppingCar'>購物車</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href='/showMessage.php' title='Message'>訊息中心 ({$unreadMsg})</a>
								</td>
							</tr>
						{/if}
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<nav class='navbar navbar-expand-md justify-content-end'>
	<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#collapsibleNavbar'>
		<span class='navbar-toggler-icon fa	fa-bars fa-2x'></span>
	</button>

	<div class='collapse navbar-collapse justify-content-md-end' id='collapsibleNavbar'>
		<ul class='navbar-nav text-center'>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='predictGame.php'>預測賽事</a>
			</li>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='searchArticle.php'>討論區</a>
			</li>
			<li class='header-nav-li nav-item dropdown active'>
				<a class='btn btn-lg header-nav-btn' data-toggle='dropdown' href='#'>
					小遊戲
					<i class="fa fa-chevron-circle-down"></i>
				</a>
				<div class='dropdown-menu'>
					<a class='dropdown-item' href='/BeiJingCart.php'>北京賽車</a>
					<a class='dropdown-item' href='/lotteryGame.php'>彩票</a>
					<a class='dropdown-item' href='/baccaratGame.php'>百家樂</a>
				</div>
			</li>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='rank.php'>找高手</a>
			</li>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='#'>即時比分</a>
			</li>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='searchUser.php'>用戶搜尋</a>
			</li>
			<li class='header-nav-li nav-item active'>
				<a class='btn btn-lg header-nav-btn' href='historyGame.php'>歷史數據</a>
			</li>
		</ul>
	</div>
</nav>

