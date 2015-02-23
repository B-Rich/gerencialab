<?php
class Equipamento_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}


	public function get($field = NULL, $value = NULL, $equal = FALSE) {
		//$this->db->order_by('fabricante', 'asc');
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

	public function get_fabricantes() {
		$this->db->distinct();
		$this->db->select('fabricante');
		$this->db->order_by('fabricante');

		return $this->db->get('equipamento')->result_array();
	}

	public function get_modelos($fab = NULL)
	{
		if($fab)
		{
			$this->db->where('fabricante', $fab);
		}
		$this->db->select('modelo');
		return $this->db->get('equipamento')->result_array();
	}

	public function add($mod, $fab, $desc) {
		$data = array(
			'modelo' => $mod,
			'fabricante' => $fab,
			'descricao' => $desc
			);

		return $this->db->insert('equipamento', $data);
	}

	public function update($old_modelo, $mod, $fab, $desc) {
		$data = array(
			'modelo' => $mod,
			'fabricante' => $fab,
			'descricao' => $desc
			);

		$this->db->where('modelo', $old_modelo);
		return $this->db->update('equipamento', $data);
	}

	public function delete($modelo) {
		$this->db->delete('equipamento', array('modelo' => $modelo));			
	}

	public function tem_patrimonio_vinculado($modelo) {
		$this->db->where('modelo', $modelo);
		$query = $this->db->get('patrimonio');

		return $query->num_rows() > 0;
	}
}