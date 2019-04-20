{extends file='route.tpl'}
{block name='body'}
	<div class='container' style='min-height: 67.5vh'>
		<div class='row justify-content-center mb-3'>
			<img src='images/logo.jpg' height='200px'>
		</div>
		<div class='row justify-content-center mb-3'>
			<h1>登入</h1>
		</div>
		<form method='post' action='login.php'>
			<div class='row justify-content-center mb-3'>
				<div class='w-50'>
					<div class='input-group mb-3 input-group-lg'>
						<div class='input-group-prepend'>
							<span class='input-group-text'>帳號:</span>
						</div>
						<input class='form-control form-control-lg' type='text' name='username' placeholder='請輸入帳號'>
					</div>
					<div class='input-group mb-3 input-group-lg'>
						<div class='input-group-prepend'>
							<span class='input-group-text'>密碼:</span>
						</div>
						<input class='form-control form-control-lg' type='password' name='password' placeholder='請輸入密碼'>
					</div>
					<input type='hidden' name='submit'>
					<button type='submit' class='w-100 btn btn-dark btn-lg mb-3'>確認</button>
					<button type='button' class='w-100 btn btn-primary btn-lg' onclick="window.location = '{$loginUrl}';">Google 登入</button>
				</div>
			</div>
		</form>
		<div class='row justify-content-center mb-3'>
			<div class='row w-50'>
				<div class='col-sm-12 col-md-6'>
					<a href='forgetPass.php'><button class='w-100 btn btn-outline-primary btn-lg'>忘記密碼</button></a>
				</div>
				<div class='col-sm-12 col-md-6'>
					<a href='register.php'><button class='w-100 btn btn-outline-primary btn-lg'>立即註冊</button></a>
				</div>
			</div>
		</div> 
	</div>

	{* Old Version
	<div style='text-align: center; min-height: 68vh' class='container'>
		<div style='height: 100%; width: 50%; margin: 0 auto'>
			<div class='login_box' style='margin-top: 0'>
				<img src='images/logo.jpg' height='200px' />
			</div>
			<div class='login_box'>
				<h1>登入</h1>
			</div>
			<div class='login_box'>
				<form method='POST' action='/login.php'>
					<div class='input-group mb-3 input-group-lg'>
						<div class="input-group-prepend">
    						<span class="input-group-text">帳號:</span>
    					</div>
						<input type='text' id='username' name='username' placeholder='請輸入帳號' class='form-control form-control-lg' />
					</div>
					<div class='input-group mb-3 input-group-lg'>
						<div class="input-group-prepend">
    						<span class="input-group-text">密碼:</span>
    					</div>
						<input type='password' id='password' name='password' placeholder='請輸入密碼' class='form-control form-control-lg' />
					</div>
					<div class='input-group mb-3 input-group-lg'>
						<button type='submit' style='width: 100%' class='btn btn-dark btn-lg'>確認</button>
						<button type='button' class='btn btn-primary btn-lg mt-2' style='width: 100%' onclick="window.location = '{$loginUrl}';">Google 登入</button>
						<input type='hidden' name='submit' value='submit' />
					</div>
				</form>
			</div>
			<div class='login_box row'>
				<div class='col-sm-6 pl-4'>
					<button class='btn btn-outline-primary' style='width: 80%'><a href='/'>忘記密碼</a></button>
				</div>
				<div class='col-sm-6 pr-4'>
					<button  class='btn btn-outline-primary' style='width: 80%'><a href='/register.php'>立即註冊</a></button>
				</div>
			</div>
		</div>
	</div>
	*}
{/block}