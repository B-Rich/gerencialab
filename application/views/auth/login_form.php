<?php 
include("header.php");
?>



<?php
$login = array(
	'name'	=> 'login',
	'id'	=> 'login',
	'value' => set_value('login'),
	'maxlength'	=> 80,
	'size'	=> 30,
);
if ($login_by_username AND $login_by_email) {
	$login_label = 'Email or login';
} else if ($login_by_username) {
	$login_label = 'Login';
} else {
	$login_label = 'Email';
}
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'size'	=> 30,
);
$remember = array(
	'name'	=> 'remember',
	'id'	=> 'remember',
	'value'	=> 1,
	'checked'	=> set_value('remember'),
	'style' => 'margin:0;padding:0',
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
);
?>


    <div class="container">

    	<?php echo form_open($this->uri->uri_string(), array('class' => 'form-signin')); ?>

        <h3 class="form-signin-heading">GerenciaLab</h3>
        <h2 class="form-signin-heading">Login</h2>

        <?php

          echo validation_errors();

          if(isset($errors[$login['name']])) 
          {
            echo '<div class="alert alert-danger">'.$errors[$login['name']]."</div>\n";
          }

          if(isset($errors[$password['name']])) {
            echo '<div class="alert alert-danger">'.$errors[$password['name']]."</div>\n";
          } 
        ?>


        <?php
        echo form_input(array_merge($login, array(
        	'class' => 'form-control',
        	'placeholder' => 'Usuário',
        	'id' => 'inputUser',
        	'required' => 'true',
        	'autofocus' => 'true')
    	)); ?>

        <?php
        echo form_password(array_merge($password, array(
        	'class' => 'form-control',
        	'placeholder' => 'Senha',
        	'id' => 'inputPassword',
        	'required' => 'true')
    	)); ?>


      <?php if(isset($captcha_html)): ?>

        <div class="form-group center-block text-center">
          <p>Digite o código abaixo:</p>

          <?php echo $captcha_html; ?><br><br>


          <?php echo form_input(array_merge($captcha, array('class' => 'form-control'))); ?>
        </div>

      <?php endif; ?>

        <button class="btn btn-lg btn-success btn-block" type="submit">Entrar</button>
        
        <p class="text-center" style="padding-top: 10px;"><?php echo anchor('/auth/forgot_password/', 'Esqueci a senha'); ?>

        <?php
          if ($this->config->item('allow_registration', 'tank_auth')) {
            echo ' | '.anchor('/auth/register/', 'Nova conta');
          } 
        ?>
        </p>

      </form>

<?php include('footer.php');?>