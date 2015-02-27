<?php
class Patrimonio_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($field = NULL, $value = NULL, $limit = 0, $offset = 0) {
		$this->db->order_by('tombo', 'asc');
		$this->db->order_by('n_serie', 'asc');

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


	public function transfere($id, $destino, $user_id) {
		$data = array('ambiente' => $destino, 'usuario_mod' => $user_id);
		$this->db->where('id', $id);
		$this->db->update('patrimonio', $data);
	}


	public function get_full($id) {
		$this->db->select('patrimonio.*, equipamento.*, nome as nome_ambiente');
		$this->db->where('patrimonio.id', $id);
		$this->db->join('ambiente', 'patrimonio.ambiente = ambiente.id');
		$this->db->join('equipamento', 'patrimonio.modelo = equipamento.modelo');
		return $this->db->get('patrimonio')->row_array();
	}

	public function update() {

	}

	public function delete($modelo) {
		
	}
}