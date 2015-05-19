<?php

include("header.php");

$login = array(
	'name'	=> 'login',
	'id'	=> 'login',
	'value' => set_value('login'),
	'maxlength'	=> 80,
	'size'	=> 30,
	'class' => 'form-control'
);
if ($this->config->item('use_username', 'tank_auth')) {
	$login_label = 'Email ou login';
} else {
	$login_label = 'Email';
}
?>

<?php echo form_open($this->uri->uri_string(), array('class' => 'form-signin')); ?>
	<div class="form-group">
		<?php echo form_label($login_label, $login['id']); ?>
		<?php echo form_input($login); ?>
		<?php echo form_error($login['name']); ?><?php echo isset($errors[$login['name']])?$errors[$login['name']]:''; ?>
	</div>
	<button class="btn btn-lg btn-warning btn-block" type="submit">Recuperar senha</button>
<?php echo form_close(); ?>


<?php include('footer.php');?>
