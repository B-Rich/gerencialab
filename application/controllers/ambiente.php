<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Ambiente extends CI_Controller
{


	function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->model('ambiente_model');
		$this->load->model('patrimonio_model');
		$this->load->model('equipamento_model');
		$this->load->library('tank_auth');
		$this->load->library('form_validation');
	}



	function index() {
		$this->lista();
	}


	function lista() {

		$this->tank_auth->check_login_redirect();

		$this->_lista($this->ambiente_model->get());

	}

	private function _lista($ambs, $data = NULL) {
		$data['title'] = "Lista de ambientes";
		$data['username'] = $this->tank_auth->get_username();

		$data['ambs'] = $ambs;

		$this->load->view('header', $data);
		$this->load->view('ambiente/lista', $data);
		$this->load->view('footer');
	}

	function inventario($id = NULL) {
		if($id === NULL) redirect('ambiente');
	
		$data['title'] = "Inventário";
		$data['username'] = $this->tank_auth->get_username();
		$data['amb'] = $this->ambiente_model->get($id)[0]['nome'];


		$data['invent'] = $this->ambiente_model->get_equips_by_modelo($id);

		$this->load->view('header', $data);
		$this->load->view('ambiente/inventario', $data);
		$this->load->view('footer');

	}


}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */