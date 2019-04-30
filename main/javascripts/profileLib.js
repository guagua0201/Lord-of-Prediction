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