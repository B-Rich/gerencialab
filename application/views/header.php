<!DOCTYPE html>
<html lang="ptb">
<head>
	<title><?php echo $title; ?></title>
	<meta charset="utf-8">
	<link href="<?php echo base_url('bootstrap/css/bootstrap.css')?>" rel="stylesheet">

	<style type="text/css">
		.container {
			padding-top: 20px;
			max-width: 800px;
		}
	</style>
</head>
<body>
<div class="container">

	<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Patrimônio UA3</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><?php echo anchor('/', 'Home') ?></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Equipamentos<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><?php echo anchor('equipamento', 'Listar') ?></li>
                  <li><?php echo anchor('equipamento/novo', 'Cadastrar') ?></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Patrimônio<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><?php echo anchor('patrimonio', 'Listar') ?></li>
                  <li><?php echo anchor('patrimonio/novo', 'Cadastrar') ?></li>
                </ul>
              </li>
            </ul>

            <?php
            	$logout_bnt = array(
        			'class' => 'btn btn-success navbar-btn navbar-right',
        			'role' => 'button');
            	echo anchor('/auth/logout/', 'Logout', $logout_bnt);
        	?>
            <p class="navbar-text navbar-right" style="padding-right: 20px;">Olá, <?php echo $username; ?></p>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

<h2 class="text-center"><?php echo $title;?></h2>
<br>
