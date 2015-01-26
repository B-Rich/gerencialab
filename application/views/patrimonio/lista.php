
<script type="text/javascript">
function setModoBusca(modoTexto, modo) {

	document.getElementById('modoBuscaTexto').innerHTML=modoTexto;
	document.getElementById('modoBuscaInput').value=modo;
}


function apagaPatrimonio(id) {
	if (confirm('Deseja realmente APAGAR o patrimônio nº "'+id+'"?')) { 
		document.getElementById('apagapatrim').value=id;
		document.getElementById('apaga').submit();
	}
}

</script>



<?php if(!isset($busca)): ?>

<!--
	Formulário de busca
-->

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
<!--
	Resultado de busca
-->
	<div class="alert alert-info">
		
			<p class="text-center">Resultados de busca para <?php echo '"'.$busca['termo'].'" ('.$busca['modo'].')'?></p>
			<br>
			<?php echo anchor('equipamento', 'Limpar', array('class' => 'btn btn-default btn-block')) ?>
		
	</div>
<?php endif; ?>


<br>

<!--
	Lista de patrimônios
-->
<table class="table table-striped">
	<thead>
		<tr>
			<th>Id</th>
			<th>Tombo</th>
			<th>Equipamento</th>
			<th>Ambiente</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>

	<?php 
	if(count($patrimonios) == 0) {
		echo '<tr><td colspan="5"><div class="alert alert-danger text-center">Nenhum patrimônio ';
		if(isset($busca)) echo 'encontrado';
		else echo 'cadastrado';
		echo '</div></td></tr>';
	}
	else {

		foreach($patrimonios as $patrim) :

		?>

		<tr>
			<td><?php echo $patrim['id'] ?></td>
			<td><?php echo $patrim['tombo'] ?></td>
			<td><?php echo $patrim['equipamento'] ?></td>
			<td><?php echo $patrim['ambiente'] ?></td>
			<td><a href="#" onClick="javascript:apagaPatrimonio('<?php echo $patrim['id'] ?>')">apagar</a></td>
		</tr>

		<?php

		endforeach;
	}?>

	</tbody>
</table>

<?php echo form_open('patrimonio/apaga', array('id' => 'apaga')); ?>
<input type="hidden" name="apagapatrim" id="apagapatrim" />
</form>