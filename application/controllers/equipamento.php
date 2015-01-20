<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Equipamento extends CI_Controller
{
	function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->model('equipamento_model');
		$this->load->library('tank_auth');
		$this->load->library('form_validation');
	}

	function index() {
		$this->novo();
	}

	function novo() {
		if (!$this->tank_auth->is_logged_in())
		{
			redirect('/auth/login/');
		}
		else
		{
			$this->load->helper('form');

			$this->form_validation->set_rules('modelo', 'Modelo', 'trim|required|is_unique[equipamento.modelo]');
			$this->form_validation->set_rules('fabricante', 'Fabricante', 'trim|required');
			$this->form_validation->set_rules('descricao', 'Descrição', 'trim|required');

			if($this->form_validation->run() == FALSE)
			{
				$this->load->view('cadastro/equipamento');
			}
			else 
			{
				echo $this->equipamento_model->add();
				$data['obj'] = "Equipamento";
				$this->load->view('sucesso_cad', $data);
			}
		}
	}

	function lista() {


	}
}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */