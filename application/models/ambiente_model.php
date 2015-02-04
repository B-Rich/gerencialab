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

	public function get_equips($amb) {

		$this->db->distinct();
		$this->db->select('patrimonio.modelo');
		$this->db->join('equipamento', 'patrimonio.modelo = equipamento.modelo');
		$this->db->where('ambiente', $amb);
		$this->db->order_by('fabricante', 'ASC');
		$this->db->order_by('descricao', 'ASC');
		$equips = $this->db->get('patrimonio')->result_array();

		$arr = array();

		foreach($equips as $equip) {
			$this->db->select('id, tombo, n_serie');
			$this->db->where('ambiente', $amb);
			$this->db->where('modelo', $equip['modelo']);
			$this->db->order_by('tombo', 'ASC');
			$patrs = $this->db->get('patrimonio')->result_array();

			$arr[$equip['modelo']]['desc'] = $this->equipamento_model->get('modelo', $equip['modelo'], TRUE)[0];

			for($i = 0; $i < count($patrs); $i++) {
				$arr[$equip['modelo']]['patrs'][$i] = $patrs[$i];
			}
		}

		return $arr;
	}

	public function add($nome, $abrev) {
		
		$data = array(
			'nome' => $nome,
			'abrev' => $abrev
			);

		return $this->db->insert('ambiente', $data);
	}

	public function update() {

	}

	public function delete($modelo) {
		//$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}