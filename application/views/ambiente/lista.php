


<br>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Abreviação</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>

	<?php 
	if(count($ambs) == 0) {
		echo '<tr><td colspan="4"><div class="alert alert-danger text-center">Nenhum equipamento ';
		if(isset($busca)) echo 'encontrado';
		else echo 'cadastrado';
		echo '</div></td></tr>';
	}
	else {

		foreach($ambs as $amb) :?>

		<tr>
			<td><?php echo $amb['id'] ?></td>
			<td><?php echo $amb['nome'] ?></td>
			<td><?php echo $amb['abrev'] ?></td>
			<td>--</td>
		</tr>
	<?php endforeach; }?>

	</tbody>
</table>


<?php echo form_open('equipamento/apaga', array('id' => 'apaga')); ?>
<input type="hidden" name="apagamodelo" id="apagamodelo" />
</form>