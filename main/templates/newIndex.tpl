<!DOCTYPE html>
<html>
	<head>
		<title>ProphecyKing</title>
		  <link rel="stylesheet" href="/stylesheets/style.css">
		  <link rel="icon" href="/images/favicon.ico">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		  <link rel='stylesheet' type='text/css' href='stylesheets/newIndex-style.css'></link>

	</head>


	<body>



		<!-- header -->
		<div class = 'container-fluid h-100'>
			<div class = 'row'>
				<div class = 'col-3'>
					<a href="/newIndex.php" class='logoImg'><img src='images/newIndex/newWord.png' width = '200px' height='100px' ></a>
				</div>

				<div class = 'col-7'>

				</div>

				<div class = 'col-2'>
					<a class = "text-center" style="color:white;text-align: center;"> nickname </a>
					<a class = "text-center" style="color:white;text-align: center;"> logout </a>
				</div>
			</div>
			<div class = 'row'>
				<div class = 'col-6'>
				</div>

				{for $i=1 to 6}
					<div class = 'col-1'>
						<a class="text-center" style="color:white;text-align: center;">{$i}</a>
					</div>
				{/for}

			</div>
		</div>

		<!-- index top bar -->

		<div class = 'container h-100' style="padding: 20px 20px; height: 500px;">
			<div class='row'>
				{for $i=1 to 5}
					<div class='col-2'>
						<a class="text-center" style="color:white;text-align: center;">{$i}</a>
					</div>
				{/for}
			</div>
			<div class = 'row'>
				{for $i=1 to 3}
					<div class = 'col-4'>
						<div class="jumbotron h-100">
						</div>
					</div>
				{/for}
			</div>
		</div>






		<!-- footer -->

	</body>


</html>