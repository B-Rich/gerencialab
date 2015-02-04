<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Ambiente extends CI_Controller
{


	function __construct()
	{
		parent::__construct();

		$this->load->model('ambiente_model');
		$this->load->model('patrimonio_model');
		$this->load->model('equipamento_model');
		$this->load->library('form_validation');
	}


	function index() {
		redirect('ambiente/lista');
	}


	function lista() {
		$this->tank_auth->check_login_redirect();

		$data['title'] = "Lista de ambientes";
		$data['username'] = $this->tank_auth->get_username();

		$data['ambs'] = $this->ambiente_model->get();

		$this->twiggy
				->set($data)
				->display('ambiente/lista');
	}

	function inventario($amb_id = NULL) {
		$this->tank_auth->check_login_redirect();

		if($amb_id === NULL) redirect('ambiente');
	
		$data['title'] = "Inventário";
		$data['username'] = $this->tank_auth->get_username();

		$data['amb'] = $this->ambiente_model->get($amb_id)[0];
		$data['lista_ambs'] = $this->ambiente_model->get();

		$data['inventario'] = $this->ambiente_model->get_equips($amb_id);

		$data['messages'] = $this->messages->get();

		$this->twiggy
				->set($data)
				->display('ambiente/inventario');
	}

	function transfere() {
		if(!$this->input->post()) redirect('patrimonio');

		$this->form_validation
				->set_error_delimiters('<div class="alert alert-danger">', '</div>')
				->set_rules('ids', 'Patrimonio', 'callback_check_ids')
				->set_rules('destino', 'Destino', 'required');

		if($this->form_validation->run() == FALSE) 
		{
			$this->inventario($this->input->post('origem'));
		}
		else
		{
			foreach($this->input->post('ids') as $patrimonio_id)
			{
				$this->patrimonio_model->transfere(
							$patrimonio_id,
							$this->input->post('destino'),
							$this->tank_auth->get_user_id()
						);
			}

			$this->messages->add('Patrimônios transferidos com sucesso', 'success');
			redirect('ambiente/inventario/'.$this->input->post('destino'));
		}
	}

	function check_ids($str) {
		if(!$str)
		{
			$this->form_validation->set_message('check_ids', 'Nenhum patrimônio selecionado');
			return FALSE;
		}
		return TRUE;
	}
}

/* End of file ambiente.php */
/* Location: ./application/controllers/ambiente.php */