function checkForm(form) {
	var valid = true;
	console.log(CKEDITOR.instances.editor.getData());
 	document.getElementById('content').setAttribute('value', CKEDITOR.instances.editor.getData());
	// console.log(document.getElementsByTagName("content")[0].value);
	if (CKEDITOR.instances.editor.getData().length == 0) {
		document.getElementById('content_notice').removeAttribute('hidden');
		valid = false;
	}
	// return false;
	return valid;
}