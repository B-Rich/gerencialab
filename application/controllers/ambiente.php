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
		$this->load->spark('twiggy/0.8.5');
	}



	function index() {
		$this->lista();
	}


	function teste() {
		
		$this->twiggy->display();
	}

	function lista() {

		$this->tank_auth->check_login_redirect();

		$this->_lista($this->ambiente_model->get());

	}

	private function _lista($ambs, $data = NULL) {
		$data['title'] = "Lista de ambientes";
		$data['username'] = $this->tank_auth->get_username();

		$data['ambs'] = $ambs;

		$this->twiggy->set($data);
		$this->twiggy->display('ambiente/lista');
	}

	function inventario($id = NULL) {
		if($id === NULL) redirect('ambiente');
	
		$data['title'] = "Inventário";
		$data['username'] = $this->tank_auth->get_username();

		$data['amb'] = $this->ambiente_model->get($id)[0];
		$data['lista_ambs'] = $this->ambiente_model->get();

		$data['inventario'] = $this->ambiente_model->get_equips_by_modelo($id);

		//$this->load->view('header', $data);
		//$this->load->view('ambiente/inventario', $data);
		//$this->load->view('footer');
		$this->twiggy->set($data);
		$this->twiggy->display('ambiente/inventario');

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

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */