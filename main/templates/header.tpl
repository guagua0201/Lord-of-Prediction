
<div class='container-fluid' style='background-color: black'>
	<div class='d-flex flex-row-reverse'>
		{if $log_status == 0}<a class='btn btn-lg header-top-btn' href='register.php'>註冊</a>{/if}
		{if $log_status == 0}<a class='btn btn-lg header-top-btn' href='login.php'>登入</a>{/if}
		{if $log_status != 0}<a class='btn btn-lg header-top-btn' href='logout.php'>登出</a>{/if}
		{if $log_status != 0}<a class='btn btn-lg header-top-btn' href='userProfile.php?user_id={$smarty.session.user_id}'>{$member}</a>{/if}
	</div>
</div>

<div id='header-jumbotron' class='jumbotron'>
	<div class='container-fluid h-100'>
		<div class='d-flex flex-row align-items-center'>
			<a href="/"><img src='images/logo.png' height='150px' class='float-left'></a>
		{if $log_status != 0}
			<div class='user-util-box'>
				<a class='btn btn-lg' href='userProfile.php?user_id={$smarty.session.user_id}'>我的帳戶</a>
			</div>
			<div class='user-util-box'>
				<a class='btn btn-lg' href='profile.php'>個人小屋</a>
			</div>
			<div class='user-util-box'>
				<a class='btn btn-lg' href='buyCash.php?step=1'>儲值頁面</a>
			</div>
			<div class='user-util-box'>
				<a class='btn btn-lg' href='shop.php'>商城入口</a>
			</div>
			<div class='user-util-box'>
				<a class='btn btn-lg' href='showMessage.php' title='Message'>訊息箱 ({$unreadMsg})</a>
			</div>
		{/if}
		</div>
	</div>
</div>

<div class='container-fluid border' style='height: 0.2rem; margin-top: -2rem'>
	<!-- I am separate line -->
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
				<a class='btn btn-lg header-nav-btn' href='liveScore.php'>即時比分</a>
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

