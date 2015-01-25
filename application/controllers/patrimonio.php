<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Patrimonio extends CI_Controller
{


	function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->model('equipamento_model');
		$this->load->model('ambiente_model');
		$this->load->model('patrimonio_model');
		$this->load->library('tank_auth');
		$this->load->library('form_validation');
	}



	function index() {
		$this->lista();
	}



	function novo() {
		$this->tank_auth->check_login_redirect();

		$this->load->helper('form');
		$this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

		$this->form_validation->set_rules('tombo', 'Tombamento', 'trim|is_unique[patrimonio.tombo]|numeric');
		$this->form_validation->set_rules('n_serie', 'Nº Série', 'trim|alpha_dash');
		$this->form_validation->set_rules('modelo', 'Equipamento', 'trim|required');
		$this->form_validation->set_rules('local', 'Localização', 'trim|required');

		if($this->form_validation->run() == FALSE)
		{
			$data['username'] = $this->tank_auth->get_username();
			$data['title'] = "Cadastro de patrimônio";

			$data['equips'] = $this->equipamento_model->get();

			$data['ambs']= $this->ambiente_model->get();

			$this->load->view('header', $data);
			$this->load->view('cadastro/patrimonio', $data);
			$this->load->view('footer');
		}
		else 
		{
			$t = $this->input->post('tombo');
			$s = $this->input->post('n_serie');
			$m = $this->input->post('modelo');
			$l = $this->input->post('local');

			$this->patrimonio_model->add($t, $s, $m, $l);

			$data['username'] = $this->tank_auth->get_username();
			$data['title'] = "Cadastro de patrimônio";
			$data['obj'] = "Patrimônio";
			$this->load->view('header', $data);
			$this->load->view('sucesso_cad', $data);
			$this->load->view('footer');
		}
	}



	function lista() {
		$this->_lista($this->equipamento_model->get());
	}



	function _lista($equips, $data = NULL) {
		$data['title'] = "Lista de equipamentos";
		$data['username'] = $this->tank_auth->get_username();

		$data['equips'] = $equips;

		$this->load->view('header', $data);
		$this->load->view('lista/equipamento', $data);
		$this->load->view('footer');
	}



	function apaga() {
		$modelo = $this->input->post('apagamodelo');

		if($modelo !== FALSE) {
			$this->equipamento_model->delete();
		}
			
		redirect('equipamento/lista');
	}



	function busca() {
		$termo = $this->input->post('buscatermo');
		$atributo = $this->input->post('modobusca');

		if($termo !== FALSE && $termo != '')
		{
			$data['title'] = "Lista de equipamentos - resultado da busca";
			$data['username'] = $this->tank_auth->get_username();

			$data['equips'] = $this->equipamento_model->get($atributo, $termo);

			$data['busca'] = array('tipo' => $atributo, 'termo' => $termo);

			$this->load->view('header', $data);
			$this->load->view('lista/equipamento', $data);
			$this->load->view('footer');
		}
		else
		{
			redirect('equipamento');
		}
	}
}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */