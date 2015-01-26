

<div class="col-sm-8 col-sm-offset-2">
<table class="table table-striped">
<tbody>

<?php

$cols = array(
	'id' => 'Id',
	'tombo' => 'Tombo',
	'modelo' => 'Modelo',
	'fabricante' => 'Fabricante',
	'descricao' => 'Descrição',
	'n_serie' => 'Nº de série',
	'ambiente' => 'Ambiente',
	'data_add' => 'Data cadastro',
	'usuario_add' => 'Cadastrado por',
	'data_mod' => 'Última modificação',
	'usuario_mod' => 'Modificado por'
	);


foreach($cols as $index => $desc):
	$data = $patrim[$index];
?>

	<tr>
		<th scope="row" class="col-sm-3"><?php echo $desc; ?></th>
		<td><?php echo $data; ?></td>
	</tr>

<?php endforeach; ?>

</tbody>
</table>
</div>