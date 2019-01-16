function checkForm(form) {
	var valid = true;	
	console.log(form.title.value);
	if (form.title.value.trim().length == 0) {
		document.getElementById('title_notice').removeAttribute('hidden');
		valid = false;
	}
	if (form.content.value.trim().length == 0) {
		doculent.getElementById('content_notice').removeAttribute('hidden');
		valid = false;
	}
	return valid;
}