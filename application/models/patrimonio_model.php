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
			$this->db->where($field, $value);
			return $this->db->get('patrimonio')->result_array();
		}
	}


	public function get_by_id($id = NULL) {
		
		if($id === NULL) return NULL;

		$this->db->where('id', $id);
		$query = $this->db->get('patrimonio');

		if($query->num_rows == 1)
		{
			return $query->row_array();
		}

		return NULL;
	}

	public function tombo_exists($t) {
		$this->db->where('tombo', $t);
		$query = $this->db->get('patrimonio');
		return $query->num_rows() == 1;
	}

	public function add($tomb, $serie, $mod, $amb, $uid) {
		date_default_timezone_set('America/Recife');
		$data = array(
			'tombo' => $tomb,
			'n_serie' => $serie,
			'modelo' => $mod,
			'ambiente' => $amb,
			'data_add' => date('Y-m-d H:i:s'),
			'usuario_add' => $uid
			);

		return $this->db->insert('patrimonio', $data);
	}

	public function update() {

	}

	public function delete($modelo) {
		//$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}