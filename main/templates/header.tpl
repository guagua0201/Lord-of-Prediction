<div class = 'container-fluid h-100'>
	<div class = 'row'>
		<div class = 'col-3'>
			<a href="/newIndex.php" class='logoImg'><img src='images/newIndex/newWord.png' width = '200px' height='100px' ></a>
		</div>

		<div class = 'col-7'>

		</div>

		{if $log_status == 1}
			<div class = 'col-1'>
				<a class = "text-center" style="color:white;text-align: center;">{$member}</a>
			</div>

			<div class = 'col-1'>
				<a class = "text-center" style="color:white;text-align: center;">登出</a>
			</div>
		{else}
			<div class = 'col-1'>
				<a href = "login.php" class = "text-center" style="color:white;text-align: center;">登入</a>
			</div>

			<div class = 'col-1'>
				<a href = "register.php" class = "text-center" style="color:white;text-align: center;">註冊</a>
			</div>

		{/if}				

		
	</div>
	<div class = 'row'>
		<div class = 'col-6'>
		</div>

		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">預測賽事</a>
		</div>
		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">討論區</a>
		</div>
		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">預測小遊戲</a>
		</div>
		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">尋找預言王</a>
		</div>
		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">即時比分</a>
		</div>
		<div class = 'col-1'>
			<a class="text-center" style="color:white;text-align: center;">歷史數據</a>
		</div>


	</div>
</div>

{if $log_status == 1}

	<div class = 'container h-100' style="padding: 20px 20px; height: 500px;>
		<div class='row'>
			<div class='col-2'>
			</div>
			<div class='col-2'>
				<a class="text-center" style="color:white;text-align: center;">個人小屋</a>
			</div>
			<div class='col-2'>
				<a class="text-center" style="color:white;text-align: center;">收支所</a>
			</div>
			<div class='col-2'>
				<a class="text-center" style="color:white;text-align: center;">商城</a>
			</div>
			<div class='col-2'>
				<a class="text-center" style="color:white;text-align: center;">訊息箱</a>
			</div>
		</div>
	</div>
{/if}