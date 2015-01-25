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
		var queryURL = "<?php echo base_url('equipamento/getPlainData')?>/";
		queryURL += modelo.replace(" ", "_");
		ajaxRequest.open("GET", queryURL, true);
		ajaxRequest.send();
	}
}

function checkForm() {
	var tombo = document.getElementById("tombo").value;
	var serie = document.getElementById("n_serie").value;
	console.log("tombo: '" + tombo + "', serie: '" + serie + "'");

	if(tombo == "" && serie == "") {
		var ans = confirm("Deseja realmente cadastrar um equipamento sem tombo e sem número de série?");
		return ans;
	}
}

</script>

<?php

echo validation_errors();

echo form_open('patrimonio/novo', array('class' => 'form-horizontal', 'id' => 'formNovoPatrim', 'onSubmit' => 'javascript:return checkForm();'));

?>
	<div class="form-group">
		<label for="tombo" class="col-sm-2 control-label">Nº Tombamento</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="tombo" name="tombo" maxlength="20" value="<?php echo set_value('tombo'); ?>">
		</div>
	</div>
	<div class="form-group">
		<label for="n_serie" class="col-sm-2 control-label">Nº Série</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="n_serie" name="n_serie" value="<?php echo set_value('n_serie'); ?>">
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
</form>

</form>

