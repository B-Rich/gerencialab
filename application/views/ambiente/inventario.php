
<h3 class="text-center"><?php echo $amb ?></h3>
<br>

<?php
	foreach($invent as $equip) {
		echo 'Modelo: '.$equip['desc']['modelo']."<br/>\n";
		echo 'Fabricante: '.$equip['desc']['fabricante']."<br/>\n";
		echo 'Descrição: '.$equip['desc']['descricao']."<br/>\n";

		foreach($equip['patrs'] as $patr) {
			echo anchor('patrimonio/detalha/'.$patr['id'], $patr['tombo']).', ';
		}
		echo "<br><br>\n";



	}



?>