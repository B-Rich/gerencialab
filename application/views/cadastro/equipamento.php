<html>
<head>
	<title>Cadastro de equipamentos</title>
</head>
<body>


<?php

echo validation_errors();

echo form_open('equipamento/novo');

?>

<label for="modelo">Modelo</label> <input type="text" name="modelo" maxlength="20" value="<?php echo set_value('modelo'); ?>" />

<br/>

<label for="fabricante">Fabricante</label> <input type="text" name="fabricante" maxlength="50" value="<?php echo set_value('fabricante'); ?>" />

<br/>

<label for="descricao">Descrição</label> <input type="text" name="descricao" value="<?php echo set_value('descricao'); ?>" />

<br/>

<input type="submit" value="Cadastrar" />

</body>
</html>