
function check_username() {
	var username = $("input[name='username']").val();
	
	if (username != "") {
		$.ajax({
			url: "register.php",
			method: 'post',
			dataType: 'JSON',
			data: {
				"check_type": "username",
				"username-check": username
			}
		}).done(function(res) {
			if (res['status'] == 'false') {
				$("#exist-username").show();
			} else if (res['status'] == 'true') {
				$("#exist-username").hide();
			}
		});
	}
}

function check_nickname() {
	var nickname = $("input[name='nickname']").val();
	
	if (nickname != "") {
		$.ajax({
			url: "register.php",
			method: 'post',
			dataType: 'JSON',
			data: {
				"check_type": "nickname",
				"nickname-check": nickname
			}
		}).done(function(res) {
			if (res['status'] == 'false') {
				$("#exist-nickname").show();
			} else if (res['status'] == 'true') {
				$("#exist-nickname").hide();
			}
		});
	}
}

function check_email() {
	var email = $("input[name='email']").val();
	
	if (email != "") {
		$.ajax({
			url: "register.php",
			method: 'post',
			dataType: 'JSON',
			data: {
				"check_type": "email",
				"email-check": email
			}
		}).done(function(res) {
			if (res['status'] == 'false') {
				$("#exist-email").show();
			} else if (res['status'] == 'true') {
				$("#exist-email").hide();
			}
		});
	}
}

function register() {
	var valid = true;
	var message = "";

	/* Banlist */
	var banList = ['arse', 'ass', 'asshole', 'bastard', 'bitch', 'bollocks', 'christ', 'crap', 'cunt', 'damn', 'frigger', 'fuck', 'goddamn', 'godsdamn', 'hell', 'jesus', 'motherfucker', 'nigga', 'nigger', 'prick', 'shit', 'bitch', 'whore', 'twat'];

	/* Username */
	var username = $("input[name='username']").val();
	if (username == "" || banList.some(element => element == username)) {
		$("#alert-username").show();
		valid = false;
	}

	/* Nickname */
	var nickname = $("input[name='nickname']").val();
	if (nickname == "" || banList.some(element => element == nickname)) {
		$("#alert-nickname").show();
		valid = false;
	}

	/* Password & Confirmed Password */
	var password = $("input[name='password']").val();
	if (password == "") {
		$("#alert-password").show();
		valid = false;
	}
	var c_password = $("input[name='c-password']").val();
	if (c_password != password) {
		$("#alert-c-password").show();
		valid = false;
	}

	/* Email */
	var email = $("input[name='email']").val();
	if (validateEmail(email) == false) {
		$("#alert-email").show();
		valid = false;
	}

	/* Terms */
	var terms = $("input[name='terms']");
	if (terms.is(":checked") == false) {
		alert("請先同意使用條款");
		valid = false;
	}

	/* Send Post */
	if (valid) {
		// console.log("valid!");
		$.ajax({
			url: "register-ajax.php",
			method: "post",
			dataType: "JSON",
			data: {
				'username': username,
				'nickname': nickname,
				'password': password,
				'c-password': c_password,
				'gender': $("select[name='gender'] > option:selected").val(),
				'email': email,
			}
		}).done(function(res) {
			if (res['status']) {
				/* Register OK - Redirect */
				window.location.href = 'register-mailed.php';
			} else {
				/* Register Failed */
				alert(res['message']);
			}
		});
	}
}