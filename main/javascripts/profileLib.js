var setTime = function(scene){
    var timeH=new Date(Date.now()).getHours();

    if(timeH == -100){
        scene.clearColor = new BABYLON.Color3(0.3921,0.584,0.929);  
    }
    else{
        scene.clearColor = new BABYLON.Color3(0.2,0.2,0.3);  

        var spaceRad = 10000;

        var starNum = 100;
    
        for(var i=0;i<starNum;i++){
            var d = 0;
            var pos = new BABYLON.Vector3(0,0,0);
            do{
                pos.x = Math.random() * spaceRad - spaceRad/2;
                pos.y = Math.random() * 1000 - 500;
                pos.z = Math.random() * spaceRad - spaceRad/2;
            d = pos.x*pos.x + pos.y*pos.y + pos.z*pos.z;
            }while(d < 10000000);
            var marker = BABYLON.Mesh.CreateSphere('cmarker', 30, 10, scene);
            marker.position = pos;
        }
    }
}

var loadMesh = function (scene,path,name,posX,posY,posZ,part){
        
    var mesh = BABYLON.SceneLoader.ImportMesh("", path, name, scene, function (newMeshes){
        globalMesh[part] = newMeshes;
        for(var i=0;i<newMeshes.length;i++){
            newMeshes[i].position = new BABYLON.Vector3(posX,posY,posZ);
            //newMeshes[i].dispose();
        }
    });

    return mesh;
}

var doActionManager = function(scene){
    scene.actionManager = new BABYLON.ActionManager(scene);

    scene.actionManager.registerAction(
    new BABYLON.ExecuteCodeAction(
            {
                trigger: BABYLON.ActionManager.OnKeyDownTrigger,
                parameter: 37
            },
            function () { 
                
                var nowPos = new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z);
                
                if(nowPos.x<200) nowPos.x+=20;
                //console.log(nowPos.x);
                camera.setPosition(nowPos);
            }
        )
    );
    scene.actionManager.registerAction(
    new BABYLON.ExecuteCodeAction(
            {
                trigger: BABYLON.ActionManager.OnKeyDownTrigger,
                parameter: 39
            },
            function () { 
                
                var nowPos = new BABYLON.Vector3(camera.position.x,camera.position.y,camera.position.z);
                if(nowPos.x>-200) nowPos.x-=20;
                //console.log(nowPos.x);
                camera.setPosition(nowPos);
            }
        )
    );
}

var wearCloth = function(id){
    console.log("wear ",id);
    var cate = productCate[id];
    var Cate;

    Cate = cate;
    Cate[0] = Cate[0] - 'a' + 'A';

    console.log("cate = "+cate+" "+Cate);
    console.log("globalMesh = ",globalMesh[cate]);
    for(var i=0;i<globalMesh[cate].length;i++){
        globalMesh[cate][i].dispose();
    }
    loadMesh(scene,modelPath+genderS+Cate+id.toString(10)+"/",genderS+Cate+id.toString(10)+".obj",0,-2.3+30,0,cate);

}

var getSelf = function(){
    // ownAcc selectAcc gender
    jQuery.ajax({
        type: "POST",
        url: 'profileGet.php',
        dataType: 'json',
        data: {arguments: [userName,1]},

        success: function(obj,textstatus){
            if( !('error' in obj) ) {
                ownAcc = obj['ownAcc'];
                gender = obj['gender'];
                selectAcc = obj['selectAcc'];
            }
            else{
                console.log('error: ', obj['error']);
            }
        },
        error: function(response) {
            console.log('error ajax',response);

        }
    });
}

var getOther= function(){
    // selectAcc gender
    jQuery.ajax({
        type: "POST",
        url: 'profileGet.php',
        dataType: 'json',
        data: {arguments: [userName,2]},

        success: function(obj,textstatus){
            if( !('error' in obj) ) {
                gender = obj['gender'];
                selectAcc = obj['selectAcc'];
            }
            else{
                console.log('error: ', obj['error']);
            }
        },
        error: function(response) {
            console.log('error ajax',response);

        }
    });
}

var getProduct = function(id){
    jQuery.ajax({
        type: "POST",
        url: 'productGet.php',
        dataType: 'json',
        data: {arguments: [id]},
        success: function(obj,textstatus){
            if(!('error' in obj) ){

                console.log('result: ',obj);
            }
            else{
                console.log('not found',obj);
                return "not found";
            }
        },
        error: function(response){
            console.log('ajax error',response);
            return "ajax error";
        }
    })
}

var productModelStr = function(id,gender,cate_ename){
    var answer = "/model";
    if(gender == 0){
        answer = answer + "/man";
    }
    else{
        answer = answer + "/woman";
    }
    answer = answer + cate_ename.charAt(0).toUpperCase() + cate_ename.slice(1)+ id.toString(10);
    return answer;
}