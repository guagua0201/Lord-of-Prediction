

function follow(userA,userB){
    

    jQuery.ajax({
        type: "POST",
        url: 'follow.php',
        dataType: 'json',
        data: {arguments: [userA,userB]},
    
        success: function (obj, textstatus) {
            if(!('error' in obj)){
                alert('成功!');
            }
            else{
                alert("失敗!");
            }
        }
    });

}

function askFollow(userA){

    jQuery.ajax({
        type: "POST",
        url: 'askFollow.php',
        dataType: 'json',
        data: {arguments: [userA]},

        success: function(obj, textstatus){
            if(!('error' in obj)){
                console.log(obj.result);
            }
            else{
                console.log('fail');
            }
        }
    });
}