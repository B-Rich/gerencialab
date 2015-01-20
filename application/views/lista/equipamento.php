

<table>
	<thead>
		<tr>
			<th>Modelo</th>
			<th>Fabricante</th>
			<th>Descrição</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>

	<?php foreach($equips as $equip) :?>
		<tr>
			<td><?php echo $equip['modelo'] ?></td>
			<td><?php echo $equip['fabricante'] ?></td>
			<td><?php echo $equip['descricao'] ?></td>
			<td><a href="#" onClick=""></a></td>
		</tr>
	<?php endforeach ?>

	</tbody>
</table>


<?php echo form_open('equipamento/apaga', array());?>

<input type="hidden"