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

var doActionManager = function(scene,camera){
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



var getSelf = async function(){
    // ownAcc selectAcc gender
    /*ownAcc = "-1";
    gender = "-1";
    selectAcc = "-1";*/
    await jQuery.ajax({
        type: "POST",
        url: 'profileGet.php',
        dataType: 'json',
        data: {arguments: [userName,1]},

        success: function(obj,textstatus){
            if( !('error' in obj) ) {
                console.log('getSelf: ',obj,obj['gender']);
                ownAcc = obj['ownAcc'];
                gender = obj['gender'];
                selectAcc = obj['selectAcc'];
                selectAcc = "00000110010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
                
                console.log('check',gender,selectAcc);
                loadPerson(scene,gender,selectAcc);
            }
            else{
                console.log('error: ', obj['error']);
                //return [-1,-1,-1];
            }
        },
        error: function(response) {
            console.log('error ajax',response);
            //return [-1,-1,-1];
        }
    });
    await makeProductInform();
    return [ownAcc,gender,selectAcc];
}

var getOther= async function(){
    // selectAcc gender
    await jQuery.ajax({
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
    return [gender,selectAcc];
}

var getProduct = async function(id){
    var result;
    await jQuery.ajax({
        type: "POST",
        url: 'productGet.php',
        dataType: 'json',
        data: {arguments: [id]},
        success: function(obj,textstatus){
            if(!('error' in obj) ){

                console.log('result: ',obj);
                console.log('return ',[obj["gender"],obj["category"],obj["cate_ename"]])
                result =  [obj["gender"],obj["category"],obj["cate_ename"]];
            }
            else{
                console.log('not found',obj);
                result = [-1,-1,-1];
            }
        },
        error: function(response){
            console.log('ajax error',response);
            result = [-1,-1,-1];
        }
    })
    return result;
}



function jsUcfirst(string) 
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}

var productFileStr = function(id,gender,cate_ename){

    var genderS;
    if(gender == 0){
        genderS = "man";
    }
    else{
        genderS = "woman";
    }

    return (genderS + jsUcfirst(cate_ename) + id);
}

var wearCloth = async function(id){
    console.log("wear ",id);
    var product = await getProduct(id);

    console.log('product = ',product);


    var genderS;

    if(product[0] === "0"){
        genderS = "man";
    }
    else{
        genderS = "woman";
    }

    var cate = product[2];
    var Cate = jsUcfirst(cate);

    console.log("cate = "+cate+" "+Cate);
    console.log("globalMesh = ",globalMesh[cate]);
    if(globalMesh[cate]){   
        for(var i=0;i<globalMesh[cate].length;i++){
            globalMesh[cate][i].dispose();
        }   
    }
    loadMesh(scene,"model/"+genderS+Cate+id.toString(10)+"/",genderS + Cate + id.toString(10) + ".obj",0,30,0,cate);
    //loadMesh(productModelStr(id,product[0],product[2]),0,30,0,cate);
}

var makeProductInform = async function(){
    for(var i=0;i<200;i++){
        if(i<31 /*ownAcc[i] === 1*/){
            productInform[i] = await getProduct(i);
            console.log('productInform '+i,productInform[i]);
        }
    }
    return ;
}


var loadPerson = function(scene,gender,selectAcc){
    
    console.log('load person ',gender,selectAcc);
    var modelPath = "model/";

    var genderS;

    if(gender == 0) genderS = "man";
    else genderS = "woman";

    loadMesh(scene,modelPath + genderS + "Body/", genderS + "Body.obj",0,30,0,'body');

    for(var i=0;i<selectAcc.length;i++){
        if(selectAcc[i] === '1'){
            var id = i+1;
            wearCloth(id);
        }
    }
    return ;
}

