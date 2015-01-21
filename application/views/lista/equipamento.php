

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
			<td><a href="#"
					onClick="javascript:document.getElementById('apagamodelo').value='<?php echo $equip['modelo'] ?>';
					document.getElementById('apaga').submit();">apagar</a></td>
		</tr>
	<?php endforeach ?>

	</tbody>
</table>


<?php echo form_open('equipamento/apaga', array('id' => 'apaga')); ?>
<input type="hidden" name="apagamodelo" id="apagamodelo" />
</form>