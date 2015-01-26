
<script type="text/javascript">
function setModoBusca(modoTexto, modo) {

	document.getElementById('modoBuscaTexto').innerHTML=modoTexto;
	document.getElementById('modoBuscaInput').value=modo;
}


function apagaModelo(modelo) {
	if (confirm('Deseja realmente APAGAR o equipamento de modelo "'+modelo+'"?')) { 
		document.getElementById('apagamodelo').value=modelo;
		document.getElementById('apaga').submit();
	}
}

</script>


<?php if(!isset($busca)): ?>
<?php echo form_open('equipamento/busca'); ?>
<div class="row">
  	<div class="col-lg-9">
		<div class="input-group">
			<span class="input-group-addon">Buscar por:</span>
			<input type="text" class="form-control" aria-label="..." name="buscatermo">
			<div class="input-group-btn">
			    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			    	<span id="modoBuscaTexto">Descrição</span> <span class="caret"></span>
			    </button>
			    <ul class="dropdown-menu" role="menu">
			      <li><a href="#" onClick="javascript:setModoBusca('Descrição', 'descricao');">Descrição</a></li>
			      <li><a href="#" onClick="javascript:setModoBusca('Modelo', 'modelo');">Modelo</a></li>
			      <li><a href="#" onClick="javascript:setModoBusca('Fabricante', 'fabricante');">Fabricante</a></li>
			    </ul>
			</div><!-- /btn-group -->
		</div><!-- /input-group -->
	</div><!-- /.col-lg-6 -->
	<div class="col-lg-3">
		<input class="btn btn-primary btn-block" type="submit" value="Buscar" />
	</div>
</div>
<input type="hidden" name="modobusca" id="modoBuscaInput" value="descricao" />
</form>

<?php else: ?>

	<div class="alert alert-info">
		
			<p class="text-center">Resultados de busca para <?php echo '"'.$busca['termo'].'" ('.$busca['modo'].')'?></p>
			<br>
			<?php echo anchor('equipamento', 'Limpar', array('class' => 'btn btn-default btn-block')) ?>
		
	</div>
<?php endif; ?>


<br>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Modelo</th>
			<th>Fabricante</th>
			<th>Descrição</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>

	<?php 
	if(count($equips) == 0) {
		echo '<tr><td colspan="4"><div class="alert alert-danger text-center">Nenhum equipamento ';
		if(isset($busca)) echo 'encontrado';
		else echo 'cadastrado';
		echo '</div></td></tr>';
	}
	else {

		foreach($equips as $equip) :?>

		<tr>
			<td><?php echo $equip['modelo'] ?></td>
			<td><?php echo $equip['fabricante'] ?></td>
			<td><?php echo $equip['descricao'] ?></td>
			<td><a href="#" onClick="javascript:apagaModelo('<?php echo $equip['modelo'] ?>')">apagar</a></td>
		</tr>
	<?php endforeach; }?>

	</tbody>
</table>


<?php echo form_open('equipamento/apaga', array('id' => 'apaga')); ?>
<input type="hidden" name="apagamodelo" id="apagamodelo" />
</form>