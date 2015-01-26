<?php

echo validation_errors();

echo form_open('patrimonio/novo', array('class' => 'form-horizontal', 'id' => 'formNovoPatrim'));

?>


	<ul class="nav nav-tabs nav-justified">
		<li role="presentation" class="active" id="simplesTab"><a href="#" onClick="javascript:cadastroSimples();">Simples</a></li>
		<li role="presentation" id="loteTab"><a href="#" onClick="javascript:cadastroLote();">Em lote</a></li>
	</ul>
	<br>

	<p class="bg-info" style="padding: 15px" id="info-lote">
		<strong>Instruções:</strong><br>
		Um equipamento por linha<br>
		Cada linha em "Nº Tombamento" corresponde a mesma linha em "Nº Série"<br>
		Não é permitido cadastrar equipamentos sem tombamento no modo em lote
	</p>


	<div class="form-group">
		<label for="tombo" class="col-sm-2 control-label">Nº Tombamento</label>
		<div class="col-sm-2">
			<span id="tomboSpan">
			</span>
		</div>

		<label for="n_serie" class="col-sm-2 control-label">Nº Série</label>
		<div class="col-sm-6">
			<span id="serieSpan">
			</span>
		</div>
	</div>
	<div class="form-group">
		<label for="modelo" class="col-sm-2 control-label">Equipamento</label>
		<div class="col-sm-4">
			<select class="form-control" name="modelo" id="modelo" onChange="javascript:setModelo(this.selectedIndex);">
				<option value=""></option>
				<?php
					// Modelos de equipamentos
					foreach($equips as $equip) {
						echo '<option value="'.$equip['modelo'].'"';
						echo set_select('modelo', $equip['modelo']).'>';
						echo $equip['modelo'];
						echo "</option>\n";
					}
				?>
			</select>
		</div>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="modelo-fabric" disabled>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-2">
			<input type="text" class="form-control" id="modelo-desc" disabled>
		</div>
	</div>

	<div class="form-group">
		<label for="local" class="col-sm-2 control-label">Localização</label>
		<div class="col-sm-10">
			<select class="form-control" name="local">
				<option value=""></option>
				<?php foreach($ambs as $amb): ?>
				<option value="<?php echo $amb['id'];?>"><?php echo $amb['nome'];?></option>
				<?php endforeach; ?>
			</select>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
		</div>
	</div>

	<input id="tipoCadastro" type="hidden" name="tipoCadastro" value="<?php echo set_value('tipoCadastro', 'simples'); ?>" />
</form>



<?php

$oldTombo = str_replace(array("\r", "\n"), array('', '\n'), set_value('tombo'));
$oldSerie = str_replace(array("\r", "\n"), array('', '\n'), set_value('n_serie'));

?>


<script type="text/javascript">

function setModelo(modeloIndex) {
	if(modeloIndex == 0) {
		document.getElementById("modelo-fabric").value = " ";
		document.getElementById("modelo-desc").value = " ";
	} else {
		var modelo = document.getElementById("modelo").options[modeloIndex].value;

		var ajaxRequest = new XMLHttpRequest();
		ajaxRequest.onreadystatechange = function() {
			if(ajaxRequest.readyState == 4) {
				var response = ajaxRequest.responseText;
				var fields = response.split("\n");
				document.getElementById("modelo-fabric").value = fields[0];
				document.getElementById("modelo-desc").value = fields[1];
			}
		}
		var queryURL = "<?php echo base_url('equipamento/get_plain_data')?>/";
		queryURL += modelo.replace(" ", "_");
		ajaxRequest.open("GET", queryURL, true);
		ajaxRequest.send();
	}
}


var simplesTab = document.getElementById("simplesTab");
var loteTab = document.getElementById("loteTab");
var tomboSpan = document.getElementById("tomboSpan");
var serieSpan = document.getElementById("serieSpan");
var tipoCad = document.getElementById("tipoCadastro");

var tomboCommon = "class=\"form-control\" id=\"tombo\" name=\"tombo\"";
var serieCommon = "class=\"form-control\" id=\"n_serie\" name=\"n_serie\"";

function cadastroSimples() {
	simplesTab.className="active";
	loteTab.className="";
	tomboSpan.innerHTML = "<input type='text' maxlength='20' "+tomboCommon+" value=\"<?php echo $oldTombo; ?>\">";
	serieSpan.innerHTML = "<input type='text' "+serieCommon+" value=\"<?php echo $oldSerie; ?>\">";
	tipoCad.value="simples";
	document.getElementById("info-lote").style.display = "none";
}

function cadastroLote() {
	simplesTab.className="";
	loteTab.className="active";
	tomboSpan.innerHTML = "<textarea "+tomboCommon+" rows='6'><?php echo $oldTombo; ?></textarea>";
	serieSpan.innerHTML = "<textarea "+serieCommon+" rows='6'><?php echo $oldSerie; ?></textarea>";
	tipoCad.value="lote";
	document.getElementById("info-lote").style.display = "block";
}


// executado quando a página é carregada
if(tipoCad.value == "simples") cadastroSimples();
else cadastroLote();

</script>
