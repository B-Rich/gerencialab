<?php
class Equipamento_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($field = NULL, $value = NULL, $equal = FALSE) {
		$this->db->order_by('modelo', 'asc');

		if(is_null($field) || is_null($value))
		{
			return $this->db->get('equipamento')->result_array();
		}
		else 
		{
			if($equal === TRUE) 
			{
				$this->db->where($field, $value);
			}
			else
			{
				$this->db->like($field, $value);
			}
			return $this->db->get('equipamento')->result_array();
		}
	}

	public function to_string($mod = NULL, $fab = NULL, $desc = NULL, $limit = 30) {
		if($mod == NULL)
		{
			return NULL;
		}

		$equip = array();

		if($fab == NULL || $desc == NULL)
		{
			$equip = $this->get('modelo', $mod, TRUE)[0];
		}
		else
		{
			$equip['modelo'] = $mod;
			$equip['fabricante'] = $fab;
			$equip['descricao'] = $desc;
		}

		$str = $equip['fabricante'].' '.$equip['modelo'].' - '.substr($equip['descricao'], 0, $limit);

		if(strlen($equip['descricao']) > $limit) $str .= '...';

		return $str;
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

	public function delete($modelo) {
		$this->db->delete('equipamento', array('modelo' => $modelo));			
	}
}