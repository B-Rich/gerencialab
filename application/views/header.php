<html>
<head>
	<title><?php echo $title; ?></title>
</head>
<body>

	Hi, <strong><?php echo $username; ?></strong>! You are logged in now. <?php echo anchor('/auth/logout/', 'Logout'); ?>

	<br/>
	<br/>

	<b>Equipamentos</b> : 
	<?php
		echo anchor('/equipamento/lista', 'Listar').' - ';
		echo anchor('/equipamento/novo', 'Cadastrar');
	?>
<br/>
<hr>
<br/>