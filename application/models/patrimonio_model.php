<?php
class Patrimonio_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($field = NULL, $value = NULL, $limit = 0, $offset = 0) {

		if($field !== NULL && $value !== NULL)
		{
			$this->db->where($field, $value);
		}

		if($limit > 0)
		{
			return $this->db->get('patrimonio', $limit, $offset)->result_array();
		}

		return $this->db->get('patrimonio')->result_array();
	}

	public function get_count() {
		return $this->db->count_all('patrimonio');
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


	public function serie_exists($serie, $modelo) {
		$this->db->where('n_serie', $serie);
		$this->db->where('modelo', $modelo);
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
		
	}
}