
function check_username() {
	let username = $("input[name='username']").val();
	
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
	let nickname = $("input[name='nickname']").val();
	
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
	let email = $("input[name='email']").val();
	
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

function open_double_check_modal() {
	let modal = $("#double-check-modal");
	let username = $("input[name='username']").val();
	let nickname = $("input[name='nickname']").val();
	let email = $("input[name='email']").val();

	$("#modal-username").append(username);
	$("#modal-nickname").append(nickname);
	$("#modal-email").append(email);
	modal.toggle();
}

function close_double_check_modal() {
	$("#modal-username").html("<strong>帳號：</strong>");
	$("#modal-nickname").html("<strong>暱稱：</strong>");
	$("#modal-email").html("<strong>信箱：</strong>");
	$("#double-check-modal").toggle();
}

function validate_registration() {
	let valid = true;
	let message = "";

	/* Banlist */
	let banList = ['arse', 'ass', 'asshole', 'bastard', 'bitch', 'bollocks', 'christ', 'crap', 'cunt', 'damn', 'frigger', 'fuck', 'goddamn', 'godsdamn', 'hell', 'jesus', 'motherfucker', 'nigga', 'nigger', 'prick', 'shit', 'bitch', 'whore', 'twat'];

	/* Username */
	let username = $("input[name='username']").val();
	if (username == "" || banList.some(element => element == username)) {
		$("#alert-username").show();
		valid = false;
	}

	/* Nickname */
	let nickname = $("input[name='nickname']").val();
	if (nickname == "" || banList.some(element => element == nickname)) {
		$("#alert-nickname").show();
		valid = false;
	}

	/* Password & Confirmed Password */
	let password = $("input[name='password']").val();
	if (password == "") {
		$("#alert-password").show();
		valid = false;
	}
	let c_password = $("input[name='c-password']").val();
	if (c_password != password) {
		$("#alert-c-password").show();
		valid = false;
	}

	/* Email */
	let email = $("input[name='email']").val();
	if (validateEmail(email) == false) {
		$("#alert-email").show();
		valid = false;
	}

	let alert_str = "";
	/* Terms */
	let terms = $("input[name='terms']");
	if (terms.is(":checked") == false) {
		alert_str += "請先同意使用條款\n";
		valid = false;
	}

	if (alert_str != "")
		alert(alert_str);

	if (valid && !($("double-check-modal").is(":visible"))) {
		open_double_check_modal();
	}
	return valid;
}

function ajax_submit() {
	if (validate_registration()) {
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
			// console.log(res['status']);
			if (res['status'] == true) {
				/* Register OK - Redirect */
				alert("Success");
				// window.location.href = 'register-mailed.php';
			} else {
				/* Register Failed */
				alert('註冊失敗');
			}
		});
	}
}
