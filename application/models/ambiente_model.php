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
			$this->db->join('qtd_equip_amb', 'ambiente.id = qtd_equip_amb.ambiente_id');
			return $this->db->get('ambiente')->result_array();
		}
		else
		{
			$this->db->where('id', $id);
			return $this->db->get('ambiente')->row_array();	
		}
	}

	public function get_equips($amb) {

		$this->db->distinct();
		$this->db->select('patrimonio.modelo');
		$this->db->join('equipamento', 'patrimonio.modelo = equipamento.modelo');
		$this->db->where('ambiente', $amb);
		$this->db->order_by('descricao', 'asc');
		$this->db->order_by('fabricante', 'asc');
		$equips = $this->db->get('patrimonio')->result_array();

		$arr = array();

		foreach($equips as $equip) {
			$this->db->select('id, tombo, n_serie');
			$this->db->where('ambiente', $amb);
			$this->db->where('modelo', $equip['modelo']);
			$this->db->order_by('tombo', 'ASC');
			$this->db->order_by('n_serie', 'ASC');
			$patrs = $this->db->get('patrimonio')->result_array();

			$arr[$equip['modelo']]['desc'] = $this->equipamento_model->get('modelo', $equip['modelo'], TRUE)[0];

			for($i = 0; $i < count($patrs); $i++)
			{
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

	public function delete($id) {
		$this->db->where('ambiente_id', $id);
		$qtd = $this->db->get('qtd_equip_amb')->row_array()['qtd_equip'];

		if($qtd > 0)
		{
			return "has equip";
		}
		else
		{
			$this->db->where('id', $id);
			return $this->db->delete('ambiente');
		}
	}
}