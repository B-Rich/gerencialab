<?php

echo validation_errors();

echo form_open('equipamento/novo', array('class' => 'form-horizontal'));

?>
  <div class="form-group">
    <label for="modelo" class="col-sm-2 control-label">Modelo</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="modelo" name="modelo" maxlength="20" value="<?php echo set_value('modelo'); ?>">
    </div>
  </div>
  <div class="form-group">
    <label for="fabricante" class="col-sm-2 control-label">Fabricante</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="fabricante" name="fabricante" value="<?php echo set_value('fabricante'); ?>">
    </div>
  </div>
  <div class="form-group">
    <label for="descricao" class="col-sm-2 control-label">Descrição</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="descricao" name="descricao" value="<?php echo set_value('descricao'); ?>">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
    </div>
  </div>
</form>

</form>

