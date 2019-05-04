function checkForm(form) {
    var valid = true;
    if (form.username.value.length == 0) {
        document.getElementById('username_notice').removeAttribute('hidden');
        valid = false;
    } else {
        document.getElementById('username_notice').setAttribute('hidden', 'hidden');
    }
    var username = form.username.value.toLowerCase();
    var banList = ['arse', 'ass', 'asshole', 'bastard', 'bitch', 'bollocks', 'christ', 'crap', 'cunt', 'damn', 'frigger', 'fuck', 'goddamn', 'godsdamn', 'hell', 'jesus', 'motherfucker', 'nigga', 'nigger', 'prick', 'shit', 'bitch', 'whore', 'twat'];
    if (banList.some(element => element == username)) {
        document.getElementById('invalid_username').removeAttribute('hidden');
        valid = false;
    }
    if (form.password.value.length == 0) {
        document.getElementById('password_notice').removeAttribute('hidden');
        valid = false;
    }
    if (document.getElementById('confirmed_pwd').value != document.getElementById('password').value) {
        document.getElementById('confirmed_notice').removeAttribute('hidden');
        valid = false;
    }
    if (form.nickname.value.length == 0) {
        document.getElementById('nickname_notice').removeAttribute('hidden');
        valid = false;
    }
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var email_val = form.email.value;
    console.log(re.test(email_val));
    if (re.test(email_val) == false) {
        document.getElementById('email_notice').removeAttribute('hidden');
        valid = false;
    }
    if(!form.terms.checked) {
        alert("請先同意使用條款");
        form.terms.focus();
        valid = false;
    }
    console.log(valid);
    return valid;
}
