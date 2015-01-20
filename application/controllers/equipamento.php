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
		$this->lista();
	}

	function novo() {
		if(!$this->tank_auth->is_logged_in())
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
				$data['username'] = $this->tank_auth->get_username();
				$data['title'] = "Cadastro de equipamentos";
				$this->load->view('header', $data);
				$this->load->view('cadastro/equipamento');
				$this->load->view('footer');
			}
			else 
			{

				$this->equipamento_model->add();

				$data['username'] = $this->tank_auth->get_username();
				$data['title'] = "Cadastro de equipamentos";
				$data['obj'] = "Equipamento";
				$this->load->view('header', $data);
				$this->load->view('sucesso_cad', $data);
				$this->load->view('footer');
			}
		}
	}

	function lista() {
		$data['title'] = "Lista de equipamentos";
		$data['username'] = $this->tank_auth->get_username();

		$data['equips'] = $this->equipamento_model->get();

		$this->load->view('header', $data);
		$this->load->view('lista/equipamento', $data);
		$this->load->view('footer');
	}

	function apaga($modelo = NULL) {
		if(is_null($modelo))
		{
			$this->lista();
		}
		else
		{
			$this->equipamento_model->delete();
		}
	}
}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */