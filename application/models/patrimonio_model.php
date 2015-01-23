<?php
class Patrimonio_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($field = NULL, $value = NULL) {
		if(is_null($field) || is_null($value))
		{
			return $this->db->get('patrimonio')->result_array();
		}
		else 
		{
			$this->db->like($field, $value);
			return $this->db->get('patrimonio')->result_array();
		}
	}

	public function add($tomb, $serie, $mod, $loc) {
		$data = array(
			'tomb' => $tomb,
			'num_serie' => $serie,
			'modelo' => $mod,
			'localizacao' => $loc
			);

		return $this->db->insert('equipamento', $data);
	}

	public function update() {

	}

	public function delete($modelo) {
		//$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}