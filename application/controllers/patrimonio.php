<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Patrimonio extends CI_Controller
{

	public $data = array();

	function __construct()
	{
		parent::__construct();

		$this->data['username'] = $this->tank_auth->get_username();
		$this->data['messages'] = $this->messages->get();
	}



	function index() {
		$this->lista();
	}



	function novo() {
		$this->tank_auth->check_login_redirect();

		$this->load->helper('form');

		$this->form_validation
				->set_error_delimiters('<div class="alert alert-danger">', '</div>');

		$tipoCad = $this->input->post('tipoCadastro');

		if($tipoCad == 'simples') {
			$this->form_validation
						->set_rules('tombo', 'Tombamento', 'trim|is_unique[patrimonio.tombo]|numeric')
						->set_rules('n_serie', 'Nº Série', 'trim|alpha_dash');
		} else {
			$this->form_validation
						->set_rules('tombo', 'Tombamento', '')
						->set_rules('n_serie', 'Nº Série', 'callback_check_series');
		}


		$this->form_validation
					->set_rules('modelo', 'Equipamento', 'trim|required')
					->set_rules('tipoCadastro', 'TipoCadastro', 'trim')
					->set_rules('local', 'Localização', 'trim|required');

		if($this->form_validation->run() == FALSE)
		{
			
			$this->data['title'] = "Cadastro de patrimônio";

			$this->data['equips'] = $this->equipamento_model->get();

			$this->data['fabs'] = $this->equipamento_model->get_fabricantes();

			$this->data['ambs']= $this->ambiente_model->get();

			$this->twiggy->set($this->data)->display('patrimonio/cadastro');
		}
		else 
		{
			$m = $this->input->post('modelo');
			$l = $this->input->post('local');
			$u = $this->tank_auth->get_user_id();

			if($tipoCad == 'simples')
			{
				$t = $this->input->post('tombo');
				$s = $this->input->post('n_serie');
				$this->patrimonio_model->add($t, $s, $m, $l, $u);
			}
			else
			{
				$tombos = explode("\n", str_replace("\r", '', $this->input->post('tombo')));
				$series = explode("\n", str_replace("\r", '', $this->input->post('n_serie')));

				for ($i=0; $i < count($tombos); $i++)
				{
					$t = $tombos[$i];
					$s = $series[$i];

					$this->patrimonio_model->add($t, $s, $m, $l, $u);
				}
			}

			$this->messages->add('Patrimônios cadastrados com sucesso', 'success');
			redirect('ambiente/inventario/'.$l);

		}
	}


	public function check_series($str) {
		$tombos = explode("\n", str_replace("\r", '', $this->input->post('tombo')));
		$series = explode("\n", str_replace("\r", '', $this->input->post('n_serie')));

		if(count($tombos) != count($series))
		{
			$this->form_validation->set_message('check_series', 'Número de linhas de tombos e séries não confere');
			return FALSE;
		}

		/* testa tombo e série  */
		$mod = trim($this->input->post('modelo'));


		for ($i=0; $i < count($tombos); $i++) {
			$t = trim($tombos[$i]);
			$s = trim($series[$i]);

			if(empty($t) && $t !== "0") {
				$this->form_validation->set_message('check_series', 'Não é possível adicionar em lote equipamentos sem tombo');
				return FALSE;
			}

			if(is_numeric($t) === FALSE)
			{
				$this->form_validation->set_message('check_series', 'Tombo '.$t.' não é um tipo numérico');
				return FALSE;
			}

			if(!$this->form_validation->is_unique($t, 'patrimonio.tombo') && $t !== "0")
			{
				$this->form_validation->set_message('check_series', 'Tombo '.$t.' já cadastrado');
				return FALSE;
			}

			if(!empty($s))
			{
				if($this->form_validation->alpha_dash($s) === FALSE)
				{
					$this->form_validation->set_message('check_series', 'Nº de série '.$s.' contém caracteres inválidos');
					return FALSE;
				}

				if(!empty($mod) && $this->patrimonio_model->serie_exists($s, $mod)) {
					$this->form_validation->set_message('check_series', 'Nº de série '.$s.' já cadastrado');
					return FALSE;
				}
			}

		}

		return TRUE;
	}



	function lista($pagina = 1) {

		$offset = ($pagina - 1)*30;

		$patrims = $this->patrimonio_model->get(NULL, NULL, 30, $offset);

		$this->data['pagina'] = $pagina;
		$this->data['total_pags'] = ceil($this->patrimonio_model->get_count()/30);

		$this->_lista($patrims, $this->data);

	}




	function _lista($patrims) {
		
		foreach($patrims as &$p) {
			$p['ambiente'] = $this->ambiente_model->get($p['ambiente']);

			$equip = $this->equipamento_model->get('modelo', $p['modelo'])[0];

			$equip_str = $equip['modelo'].' - ';

			if(strlen($equip['descricao']) > 30)
			{
				$equip_str .= substr($equip['descricao'], 0, 30).'...';
			}
			else
			{
				$equip_str .= $equip['descricao'];
			}

			$p['equipamento'] = $equip_str;
		}

		$this->data['patrimonios'] = $patrims;

		$this->data['title'] = "Lista de patrimônios";

		$this->twiggy->set($this->data)->display('patrimonio/lista');
	}



	function apaga() {
		$patrim = $this->input->post('apagapatrim');

		if($patrim !== FALSE) {
			$this->equipamento_model->delete($patrim);
		}
		
		redirect('patrimonio/lista');
	}


	function detalha($id = NULL) {

		if($id === NULL) redirect('patrimonio');

		$p = $this->patrimonio_model->get_full($id);

		if($p === NULL) redirect('patrimonio');

		
		$p['tombo'] = ($p['tombo'] > 0) ? $p['tombo'] : '<em style="color: red;">sem tombo</em>';
		$p['equipamento'] = $p['fabricante'].' '.$p['modelo'].' - '.$p['descricao'];

		// usuários
		$this->load->model('tank_auth/users');
		$p['usuario_add'] = $this->users->get_user_by_id($p['usuario_add'], TRUE)->username;
		$p['usuario_mod'] = $p['usuario_mod']
				? $this->users->get_user_by_id($p['usuario_mod'], TRUE)->username
				: '-' ;


		// datas
		setlocale(LC_ALL, 'ptb');

		$p['data_add'] = strftime("%d/%B/%Y @ %H:%M", strtotime($p['data_add']));
		$p['data_mod'] = $p['data_mod']
				? strftime("%d/%B/%Y @ %H:%M", strtotime($p['data_mod']))
				: '-';


		$this->data['title'] = "Detalhe de patrimônio";
		$this->data['patrim'] = $p;

		$this->twiggy->set($this->data)->display('patrimonio/detalha');
	}



	function busca() {
		$termo = $this->input->post('buscatermo');
		$atributo = $this->input->post('modobusca');

		if($termo !== FALSE && $termo != '')
		{
			$this->data['title'] = "Lista de equipamentos - resultado da busca";

			$this->data['equips'] = $this->equipamento_model->get($atributo, $termo);

			$this->data['busca'] = array('tipo' => $atributo, 'termo' => $termo);

			$this->load->view('header', $this->data);
			$this->load->view('equipamento/lista', $this->data);
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