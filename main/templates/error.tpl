<!DOCTYPE html>
<html>
	<head>
	  <title>Error</title>
	  <link rel="stylesheet" href="/stylesheets/style.css">
	  <link rel="icon" href="/images/favicon.ico">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</head>
	<body>

		<div class='container mt-3'>
			<h2>ProphecyKing</h2>
			<p>Error: {$error}</p>
			{if isset($msg)}<p>{$msg}</p>{/if}
		</div>
	</body>
</html>
