
/* disable auto submitting form on enter press */
$(document).ready(function() {
	$("form").keypress(function(e) {
		if (e.which == 13) {
			forgetPass();
			return false;
		}
	})
});

function check_email(callback) {
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
				callback(false);
			} else if (res['status'] == 'true') {
				$("#exist-email").hide();
				callback(true);
			}
		});
	}
}

async function forgetPass() {
	let email = $("input[name='email']").val();
	if (validateEmail(email) == false) {
		$("#alert-email").show();
		return false;
	}
	if (email == "") {
		$("#alert-email").show();
		return false;
	}

	check_email(function(res) {
		if (res === true) {
			$.ajax({
				url: "forgetPass.php",
				method: 'post',
				dataType: 'json',
				data: {
					'type': 'success',
					'email': email
				}
			}).done(function(res) {
				if (res['status'] == 'false') {
					console.log("Failed");
				} else if (res['status'] == 'true') {
					console.log("Success");
				}
			});
		}
	});
}