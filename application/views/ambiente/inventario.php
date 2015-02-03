
<h3 class="text-center"><?php echo $amb ?></h3>
<br>

<?php

	if(count($invent) == 0)
	{
		echo '<div class="alert alert-info text-center">'.
				'Nenhum patrimônio cadastrado para este ambiente</div>'."\n";
	}
	
	foreach($invent as $equip) {

?>
<div class="col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
	<div class="panel-heading"><strong><?php echo $this->equipamento_model->to_string($equip['desc']['modelo'], $equip['desc']['fabricante'], $equip['desc']['descricao'], 100)?></strong></div>
	<div class="panel-body">
		<?php

		foreach($equip['patrs'] as $num => $patr)
		{

			echo '<div class="checkbox"><label>';
			echo '<input type="checkbox" name="transf_patrim" value="'.$patr['id'].'">';

			echo anchor('patrimonio/detalha/'.$patr['id'],
				($patr['tombo'] == 0)?'#'.$patr['id']:$patr['tombo']);

			echo ' - SN: ';
			echo (empty($patr['n_serie']))?'-':$patr['n_serie'];
			
			echo '</label></div>'."\n";
			
		}

		?>
	</div> <!-- class: panel body -->
</div><!-- class: panel -->
</div><!-- class: column container -->


<?php

	}	// foreach($invent as $equip)

?>

