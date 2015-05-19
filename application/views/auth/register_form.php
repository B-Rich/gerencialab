<?php 
include("header.php");
?>


<?php
if ($use_username) {
	$username = array(
		'name'	=> 'username',
		'id'	=> 'username',
		'value' => set_value('username'),
		'maxlength'	=> $this->config->item('username_max_length', 'tank_auth'),
		'size'	=> 30,
		'class' => 'form-control'
	);
}
$email = array(
	'name'	=> 'email',
	'id'	=> 'email',
	'value'	=> set_value('email'),
	'maxlength'	=> 80,
	'size'	=> 30,
	'class' => 'form-control'
);
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'value' => set_value('password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
	'class' => 'form-control'
);
$confirm_password = array(
	'name'	=> 'confirm_password',
	'id'	=> 'confirm_password',
	'value' => set_value('confirm_password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
	'class' => 'form-control'
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
	'class' => 'form-control'
);
?>

<div class="container">

<?php echo form_open($this->uri->uri_string(), array('class' => 'form-signin')); ?>

<?php 

	echo validation_errors();
	if(isset($errors[$username['name']])) 
	{
		echo '<div class="alert alert-danger">'.$errors[$username['name']]."</div>\n";
	}

	if(isset($errors[$email['name']])) {
		echo '<div class="alert alert-danger">'.$errors[$email['name']]."</div>\n";
	} 

?>

<?php if ($use_username) { ?>
	<div class="form-group">
		<?php echo form_label('Nome de Usuário', $username['id']); ?>
		<?php echo form_input($username); ?>
	</div>
<?php } ?>

	<div class="form-group">
		<?php echo form_label('Email', $email['id']); ?>
		<?php echo form_input($email); ?>
	</div>
	<div class="form-group">
		<?php echo form_label('Senha', $password['id']); ?>
		<?php echo form_password($password); ?>
	</div>
	<div class="form-group">
		<?php echo form_label('Confirme a senha', $confirm_password['id']); ?>
		<?php echo form_password($confirm_password); ?>
	</div>

	<?php if ($captcha_registration) { ?>
	<div class="form-group">
		<p>Digite o código abaixo</p>
		<?php echo $captcha_html; ?>
		<?php echo form_input($captcha); ?>
	</div>
	<?php } ?>

<button class="btn btn-lg btn-success btn-block" type="submit">Registrar</button>
<?php echo form_close(); ?>


<?php include('footer.php');?>