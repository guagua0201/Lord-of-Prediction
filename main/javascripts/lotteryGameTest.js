var config = {
    type: Phaser.AUTO,
    width: 1200,
    height: 780,
    parent: "game_block",
    physics: {
        default: 'arcade'
    },
    scene: {
        preload: preload,
        create: create,
        update: update
    }
};


function preload(){
    this.load.image("underBar","");
    this.load.image("numberBar","");
    this.load.image("bg","");
}

function create(){

    gameGroup = this.add.group();

    gameGroup.create(this.width/2,this.height/2,"underBar");
    


}

function update(){

}