<?php
/* Smarty version 3.1.33, created on 2019-01-12 18:27:49
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/listArticle.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c3a2395413bc6_72665806',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6d6f72ea35cc500c2646617c939034c2b670d934' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/listArticle.tpl',
      1 => 1547314068,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c3a2395413bc6_72665806 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_9009074835c3a2395407f07_48963226', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_9009074835c3a2395407f07_48963226 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_9009074835c3a2395407f07_48963226',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/Smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>

	<div style='min-height: 68vh; min-width: 80vw' class='container'>
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<h2>討論版</h2>
					<form method="GET" action="listArticle.php" style="width: 100%;">
						<div class="input-group-append">
							<input class="form-control border-secondary py-2" type="search" placeholder="請輸入關鍵字" name="search" />
							<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style='margin-top: 50px'>
			<?php if (count($_smarty_tpl->tpl_vars['data']->value) == 0) {?>
				<h3>沒有結果</h3>
			<?php } else { ?>
				<table style='margin-top: 50px' class='table table-bordered table-striped table-sm'>
					<thead>
						<tr class='d-flex' style='text-align: center'>
							<th class='col-sm-6'>主題</th>
							<th class='col-sm-1'>&nbsp;</th>
							<th class='col-sm-2'>作者</th>
							<th class='col-sm-2'>最新回覆</th>
							<th class='col-sm-1'></th>
						</tr>
					</thead>
					<tbody>
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value, 'row');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
?>
							<tr class='d-flex'>
								<td class='col-sm-6'>
									&#91;<?php echo $_smarty_tpl->tpl_vars['row']->value['category_name'];?>
&#93;&nbsp;
									<a href="/showArticle.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['title'];?>
</a>
								</td>
								<td class='col-sm-1' style='text-align: center'>
									<img src='/images/user_default.jpg' height='50px' width='50px' />
								</td>
								<td class='col-sm-2' style='text-align: center'>
									<a href="/userProfile.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['author'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['user_username'];?>
</a>
									<br /><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['row']->value['update_time'],'%Y-%m-%d %H:%M:%S');?>

								</td>
								<td class='col-sm-2' style='text-align: center'>
									<a href="/userProfile.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['author'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['user_username'];?>
</a>
									<br /><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['row']->value['update_time'],'%Y-%m-%d %H:%M:%S');?>

								</td>
								<td class='col-sm-1'>
									<a href="editArticle.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" title='Edit article' class='icon'>
										<button class='btn btn-outline-secondary'>
											<i class='fa fa-pencil'></i>
										</button>
									</a>
									<a href="deleteArticle.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" title='Delete article' class='icon'>
										<button class='btn btn-outline-secondary'>
											<i class='fa fa-trash'></i>
										</button>
									</a>
								</td>
							</tr>
						<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					</tbody>
				</table>
			<?php }?>
		</div>
	</div>
<?php
}
}
/* {/block 'body'} */
}
