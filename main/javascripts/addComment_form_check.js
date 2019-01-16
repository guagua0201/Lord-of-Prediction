function checkForm(form) {
	var valid = true;
	console.log(CKEDITOR.instances.editor.getData());
	if (CKEDITOR.instances.editor.getData().length == 0) {
		document.getElementById('content_notice').removeAttribute('hidden');
		valid = false;
	}
	return valid;
}