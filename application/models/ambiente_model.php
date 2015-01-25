<?php
class Ambiente_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get() {
		return $this->db->get('ambiente')->result_array();
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