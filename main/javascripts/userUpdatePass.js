
/* disable auto submitting form on enter press */
$(document).ready(function() {
	$("form").keypress(function(e) {
		if (e.which == 13) {
			userUpdatePass();
			return false;
		}
	})
});

function userUpdatePass() {
	let password = $("input[name='password']").val();
	if (password == "") {
		$("#alert-password").show();
		return false;
	}

	$("#userUpdatePass").submit();
}