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

			$this->form_validation->set_rules('tomb', 'Tombamento', 'trim|is_unique[patrimonio.tombamento]');
			$this->form_validation->set_rules('serie', 'No. de série', 'trim');
			$this->form_validation->set_rules('modelo', 'Modelo', 'trim|required');

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