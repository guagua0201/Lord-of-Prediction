function checkForm(form) {
	var valid = true;
	if (form.title.value.trim().length == 0) {
		document.getElementById('title_notice').removeAttribute('hidden');
		valid = false;
	}
	if (CKEDITOR.instances.content.getData().trim().length == 0) {
		document.getElementById('content_notice').removeAttribute('hidden');
		valid = false;
	}
	return valid;
}
