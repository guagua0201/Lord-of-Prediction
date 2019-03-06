function buyFunction(AccID,moneyType,price,name,userName){
    if(confirm('你確定要購買 '+ name + ' 嗎?')){
        console.log("buy!");
        jQuery.ajax({
            type: "POST",
            url: 'php/buyAcc.php',
            dataType: 'json',
            data: {arguments: [userName,AccID,price,moneyType]},
        
            success: function (obj, textstatus) {
                if(!('error' in obj)){
                    alert('成功! 你還剩下'+ obj.leftMoney +"元!");
                }
                else{
                    alert("交易失敗! 原因是: " + obj.error);
                }
            }
        });
    }
    else{
        console.log("oh no no");
    }
    return 0;
}