function buyFunction(AccID,moneyType,price,name,userName){
    if(confirm('你確定要購買 '+ name + ' 嗎?')){
        console.log("buy!",AccID,moneyType,price,name,userName);
        jQuery.ajax({
            type: "POST",
            url: 'buyAcc.php',
            dataType: 'json',
            data: {arguments: [userName,AccID,price,moneyType]},
        
            success: function (obj, textstatus) {
                if(!('error' in obj)){
                    console.log('hi');
                    alert('成功! 你還剩下'+ obj.leftMoney +"元!");
                }
                else{
                    console.log('hi2');
                    alert("交易失敗! 原因是: " + obj.error);
                }
            },
            error: function(obj, textstatus){
                console.log('hi3');
                console.log(obj);
                console.log(textstatus);
            }
        });
        console.log("check");
    }
    else{
        console.log("oh no no");
    }
    return 0;
}