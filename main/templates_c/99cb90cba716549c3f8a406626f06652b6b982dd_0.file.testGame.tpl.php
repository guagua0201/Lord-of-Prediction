<?php
/* Smarty version 3.1.33, created on 2019-01-09 14:15:36
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/testGame.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c35f3f8804783_91116918',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '99cb90cba716549c3f8a406626f06652b6b982dd' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/testGame.tpl',
      1 => 1547039732,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:header.tpl' => 1,
    'file:footer.tpl' => 1,
  ),
),false)) {
function content_5c35f3f8804783_91116918 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
    <head>
      <title>Hello</title>
      <link rel="stylesheet" href="/stylesheets/style.css">
      <link rel="icon" href="/images/favicon.ico">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
      <?php echo '<script'; ?>
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><?php echo '</script'; ?>
>
      <?php echo '<script'; ?>
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"><?php echo '</script'; ?>
>
      <?php echo '<script'; ?>
 src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"><?php echo '</script'; ?>
>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <?php echo '<script'; ?>
 src="https://cdn.jsdelivr.net/npm/phaser@3.15.1/dist/phaser-arcade-physics.min.js"><?php echo '</script'; ?>
>
    </head>
    <body>
        
            <?php echo '<script'; ?>
>
            var config = {
                type: Phaser.AUTO,
                width: 800,
                height: 600,
                parent: 'game_block',
                physics: {
                    default: 'arcade',
                    arcade: {
                        gravity: { y: 200 }
                    }
                },
                scene: {
                    preload: preload,
                    create: create
                }
            };

            var game = new Phaser.Game(config);

            function preload ()
            {
                this.load.setBaseURL('http://labs.phaser.io');

                this.load.image('sky', 'assets/skies/space3.png');
                this.load.image('logo', 'assets/sprites/phaser3-logo.png');
                this.load.image('red', 'assets/particles/red.png');
            }

            function create ()
            {
                this.add.image(400, 300, 'sky');

                var particles = this.add.particles('red');

                var emitter = particles.createEmitter({
                    speed: 100,
                    scale: { start: 1, end: 0 },
                    blendMode: 'ADD'
                });

                var logo = this.physics.add.image(400, 100, 'logo');

                logo.setVelocity(100, 200);
                logo.setBounce(1, 1);
                logo.setCollideWorldBounds(true);

                emitter.startFollow(logo);
            }
            <?php echo '</script'; ?>
>
        
        <?php $_smarty_tpl->_subTemplateRender('file:header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
        <div style='min-height: 68vh; text-align: center' id='game_block' class='jumborton'>
        </div>
        <?php $_smarty_tpl->_subTemplateRender('file:footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    </body>
</html>
<?php }
}
