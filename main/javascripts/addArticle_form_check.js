function checkForm(form) {
	var valid = true;
	if (form.title.value.trim().length == 0) {
		document.getElementById('title_notice').removeAttribute('hidden');
		valid = false;
	}
	if (form.content.value.trim().length == 0) {
		document.getElementById('content_notice').removeAttribute('hidden');
		valid = false;
	}
	return valid;
}

function printHello() {
	console.log("Hello World");
}