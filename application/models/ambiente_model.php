<?php
class Ambiente_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($id = NULL) {
		if($id === NULL)
		{
			$this->db->order_by('nome', 'asc');
			return $this->db->get('ambiente')->result_array();
		}
		else
		{
			$this->db->where('id', $id);
			return $this->db->get('ambiente')->result_array();	
		}
	}

	public function get_equips_by_modelo($amb) {
		$this->db->where('ambiente', $amb);
		$this->db->select('modelo');
		$this->db->distinct();
		$equips = $this->db->get('patrimonio')->result_array();

		$arr = array();

		foreach($equips as $equip) {
			$this->db->select('id, tombo');
			$this->db->where('ambiente', $amb);
			$this->db->where('modelo', $equip['modelo']);
			$patrs = $this->db->get('patrimonio')->result_array();

			$arr[$equip['modelo']]['desc'] = $this->equipamento_model->get('modelo', $equip['modelo'], TRUE)[0];

			for($i = 0; $i < count($patrs); $i++) {
				$arr[$equip['modelo']]['patrs'][$i] = $patrs[$i];
			}
		}

		return $arr;
	}

	public function add($nome, $abrev) {
		/*
		$data = array(
			'tomb' => $tomb,
			'num_serie' => $serie,
			'modelo' => $mod,
			'localizacao' => $loc
			);

		return $this->db->insert('equipamento', $data);
		*/
	}

	public function update() {

	}

	public function delete($modelo) {
		//$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}