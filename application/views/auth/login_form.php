<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Patrimônio UA3 - Login</title>

	<!-- Bootstrap core CSS -->
    <link href="<?php echo base_url('bootstrap/css/bootstrap.css')?>" rel="stylesheet">


    <style type="text/css">
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
  text-align:center;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin #inputUser {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin #inputPassword {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}



    </style>

	</head>

  <body>




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

        <h3 class="form-signin-heading">Patrimônio UA3</h3>
        <h2 class="form-signin-heading">Login</h2>

        <?php
  
          function error($str) {
            echo '<div class="alert alert-danger">'.$str."</div>\n";
          }

          $login_errors = validation_errors();
          if(!empty($login_errors)) error($login_errors);

          if(isset($errors[$login['name']])) error($errors[$login['name']]);

          if(isset($errors[$password['name']])) error($errors[$password['name']]);  

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

          <?php echo $captcha_html; ?><br><br>


          <?php echo form_input(array_merge($captcha, array('class' => 'form-control'))); ?>
        </div>

      <?php endif; ?>

        <button class="btn btn-lg btn-success btn-block" type="submit">Entrar</button>
      </form>

    </div> <!-- /container -->


  </body>
</html>
