<html>
<head>
	<title><?php echo $title; ?></title>
	<meta charset="utf-8">
</head>
<body>

	Hi, <strong><?php echo $username; ?></strong>! You are logged in now. <?php echo anchor('/auth/logout/', 'Logout'); ?>

	<br/>
	<br/>

	<b>Equipamentos:</b>
	<?php
		echo anchor('/equipamento/lista', 'Listar').' - ';
		echo anchor('/equipamento/novo', 'Cadastrar');
	?>

	<br/><br/>
	<b>Patrimônio:</b>
	<?php
		echo anchor('patrimonio/lista', 'Listar').' - ';
		echo anchor('patrimonio/novo', 'Cadastrar');
	?>

<br/>
<hr>
<br/>