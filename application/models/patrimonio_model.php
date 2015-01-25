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
		date_default_timezone_set('America/Recife');
		$data = array(
			'tombo' => $tomb,
			'n_serie' => $serie,
			'modelo' => $mod,
			'ambiente' => $loc,
			'data_add' => date('Y-m-d H:i:s')
			);

		return $this->db->insert('patrimonio', $data);
	}

	public function update() {

	}

	public function delete($modelo) {
		//$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}