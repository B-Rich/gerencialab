<?php
class Equipamento_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get() {

	}

	public function add() {
		$data = array(
			'modelo' => $this->input->post('modelo'),
			'fabricante' => $this->input->post('fabricante'),
			'descricao' => $this->input->post('descricao')
			);

		return $this->db->insert('equipamento', $data);
	}

	public function update() {

	}
}