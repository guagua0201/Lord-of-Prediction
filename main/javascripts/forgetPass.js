
function check_email() {
	let email = $("input[name='email']").val();
	
	if (email != "") {
		$.ajax({
			url: "forgetPass.php",
			method: 'post',
			dataType: 'json',
			data: {
				"type": "check-exist",
				"email": email
			}
		}).done(function(res) {
			if (res['status'] == 'false') {
				$("#exist-email").show();
				return false;
			} else if (res['status'] == 'true') {
				$("#exist-email").hide();
				return true;
			}
		});
	}
}

function forgetPass() {
	let email = $("input[name='email']").val();
	if (validateEmail(email) == false) {
		$("#alert-email").show();
		return false;
	}

	if (check_email()) {
		$.ajax({
			url: "forgetPass.php",
			method: 'post',
			dataType: 'json',
			data: {
				'type': 'success'
				'email': email
			}
		}).done(function(res)) {
			if (res['status'] == 'false') {
				console.log("Failed");
			} else if (res['status'] == 'true') {
				console.log("Success");
			}
		}
	}

}