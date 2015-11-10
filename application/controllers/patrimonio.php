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
					->set_rules('modelo', 'Equipamento', 'trim|required')
					->set_rules('local', 'Localização', 'trim|required')
					->set_rules('tombo[]', 'Tombamento', '')
					->set_rules('n_serie[]', 'Nº Série', 'callback_check_patrimonios');

		$tombos = array();
		$series = array();

		if($this->input->post())
		{
			$tombos = $this->input->post('tombo');
			$series = $this->input->post('n_serie');
		}

		if($this->form_validation->run() == FALSE)
		{
			
			$this->data['title'] = "Cadastro de patrimônio";

			$this->data['fabs'] = $this->equipamento_model->get_fabricantes();

			$this->data['ambs']= $this->ambiente_model->get();

			if($this->input->post())
			{
				$pats = array();

				for($i = 0; $i < count($tombos); $i++)
				{
					if(!empty($tombos[$i]) && !empty($series[$i]))
					{
						$pats[$i]['tombo'] = $tombos[$i];
						$pats[$i]['n_serie'] = $series[$i];
					}
					
				}
				$this->data['patrimonios'] = $pats;
			}

			$this->twiggy->set($this->data)->display('patrimonio/cadastro');
		}
		else 
		{
			$m = $this->input->post('modelo');
			$l = $this->input->post('local');
			$u = $this->tank_auth->get_user_id();

			// TODO
			for($i = 0; $i < count($tombos); $i++)
			{
				$t = $tombos[$i];
				$s = $series[$i];
				$this->patrimonio_model->add($t, $s, $m, $l, $u);
			}

			$this->messages->add('Patrimônios cadastrados com sucesso', 'success');
			redirect('ambiente/inventario/'.$l);

		}
	}

	public function check_patrimonios($str) {
		$tombos = $this->input->post('tombo');
		$series = $this->input->post('n_serie');

		for($i=0, $n = count($tombos); $i < $n; $i++)
		{

			$t = trim($tombos[$i]);
			$s = trim($series[$i]);

			if(empty($t) && empty($s))
			{
				$this->form_validation->set_message('check_patrimonios', 'Não é possível cadastrar equipamento sem tombo e nº de série');
				return FALSE;
			}

			if(is_numeric($t) === FALSE && !empty($t))
			{
				$this->form_validation->set_message('check_patrimonios', 'Tombo '.$t.' não é um tipo numérico');
				return FALSE;
			}

			if(!$this->form_validation->is_unique($t, 'patrimonio.tombo') && !empty($t))
			{
				$this->form_validation->set_message('check_patrimonios', 'Tombo '.$t.' já cadastrado');
				return FALSE;
			}

			if(!empty($s))
			{
				if($this->form_validation->alpha_dash($s) === FALSE)
				{
					$this->form_validation->set_message('check_patrimonios', 'Nº de série '.$s.' contém caracteres inválidos');
					return FALSE;
				}

				if(!$this->form_validation->is_unique($s, 'patrimonio.n_serie')) {
					$this->form_validation->set_message('check_patrimonios', 'Nº de série '.$s.' já cadastrado');
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

			$p['equipamento'] = $equip['descricao'].' '.$equip['fabricante'].' '.$equip['modelo'];
		}

		$this->data['patrimonios'] = $patrims;

		$this->data['title'] = "Lista de patrimônios";

		$this->twiggy->set($this->data)->display('patrimonio/lista');
	}



	function delete($patrim) {

		if($patrim !== FALSE) {
			$this->patrimonio_model->delete($patrim);
		}
		
		redirect('patrimonio/lista');
	}


	function detalha($id = NULL) {

		if($id === NULL) redirect('patrimonio');

		$p = $this->patrimonio_model->get_full($id);

		if($p === NULL) redirect('patrimonio');

		
		$p['tombo'] = ($p['tombo'] > 0) ? $p['tombo'] : '<em style="color: red;">sem tombo</em>';
		$p['equipamento'] = $p['descricao'].' - '.$p['fabricante'].' '.$p['modelo'];

		// usuários
		$this->load->model('tank_auth/users');
		$p['usuario_add'] = $this->users->get_user_by_id($p['usuario_add'], TRUE)->username;
		$p['usuario_mod'] = $p['usuario_mod']
				? $this->users->get_user_by_id($p['usuario_mod'], TRUE)->username
				: '-' ;


		// datas
		setlocale(LC_ALL, 'ptb');

		$p['data_add'] = strftime("%d/%b/%Y @ %H:%M", strtotime($p['data_add']));
		$p['data_mod'] = $p['data_mod']
				? strftime("%d/%B/%Y @ %H:%M", strtotime($p['data_mod']))
				: '-';


		$this->data['title'] = "Detalhe de patrimônio";
		$this->data['patrim'] = $p;

		$this->twiggy->set($this->data)->display('patrimonio/detalha');
	}



	function busca() {
		$busca = $this->input->post('busca');
		$termo = $busca['termo'];
		$atributo = $busca['modo'];

		if(empty($termo) || empty($atributo))
		{
			redirect('patrimonio');
		}

		$this->data['busca']['termo'] = $termo;
		$this->data['busca']['modo'] = $atributo;

		$match = FALSE;
		if($atributo == 'tombo' || $atributo == 'n_serie') $match = TRUE;

		$result = $this->patrimonio_model->get($atributo, $termo, 0, 0, $match);
		$this->_lista($result);

		/*
		if(!empty($result))
		{
			redirect('patrimonio/detalha/'.$result[0]['id']);
		}
		else
		{
			$this->data['busca'] = $busca;
			$this->messages->add('Patrimônio não cadastrado', 'warning');
			$this->data['messages'] = $this->messages->get();
			$this->lista();
			//redirect('patrimonio/lista');
		}*/

	}

}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */