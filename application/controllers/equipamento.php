<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Equipamento extends CI_Controller
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
					->set_rules('modelo', 'Modelo', 'trim|required|callback_check_modelo')
					->set_rules('fabricante', 'Fabricante', 'trim|required')
					->set_rules('descricao', 'Descrição', 'trim|required');

		if(!$this->input->post('old-modelo'))
		{
			$this->form_validation->set_rules('modelo', 'Modelo', 'trim|required|callback_check_modelo|is_unique[equipamento.modelo]');
		}

		if($this->form_validation->run() == FALSE)
		{
			$this->data['title'] = "Cadastro de equipamento";
			$this->twiggy->set($this->data)->display('equipamento/cadastro');
		}
		else 
		{
			$m = $this->input->post('modelo');
			$f = $this->input->post('fabricante');
			$d = $this->input->post('descricao');

			if($this->input->post('old-modelo'))
			{
				$this->equipamento_model->update($this->input->post('old-modelo'), $m, $f, $d);
				$this->messages->add('Equipamento "'.$m.'" atualizado com sucesso', 'success');
			}
			else
			{
				$this->equipamento_model->add($m, $f, $d);
				$this->messages->add('Equipamento "'.$m.'" cadastrado com sucesso', 'success');
			}

			
			redirect('equipamento');
			
		}
	}

	function check_modelo($str) {
		// Minúsculas, maiúsculas, números, traço, espaço, ponto e +
		if(preg_match("/^[a-zA-Z0-9\- .+]{1,}$/", $str) == 1)
		{
			return TRUE;
		}
		$this->form_validation->set_message('check_modelo', 'O campo Modelo contém caracteres inválidos');
		return FALSE;
	}


	function edita($modelo = NULL) {

		if($modelo === NULL) redirect('equipamento');

		$modelo = str_replace("_", " ", $modelo);

		$equip = $this->equipamento_model->get('modelo', $modelo, TRUE);

		if($equip == NULL) redirect('equipamento');

		$this->data['edit'] = $equip[0];
		$this->data['title'] = "Editar equipamento";

		$this->twiggy->set($this->data)->display('equipamento/cadastro');

	}





	function lista() {

		$this->tank_auth->check_login_redirect();

		$this->_lista($this->equipamento_model->get());
	}



	private function _lista($equips) {
		$this->data['title'] = "Lista de equipamentos";
		$this->data['equips'] = $equips;

		$this->twiggy->set($this->data)->display('equipamento/lista');
	}



	function apaga() {
		$modelo = $this->input->post('apagamodelo');

		if($modelo !== FALSE) {

			if($this->equipamento_model->tem_patrimonio_vinculado($modelo))
			{
				$this->messages->add('Não é possível apagar: há patrimônios vinculados ao equipamento "'.$modelo.'"', 'danger');
			}
			else
			{
				$this->messages->add('Equipamento removido', 'success');
				$this->equipamento_model->delete($modelo);
			}
		}
			
		redirect('equipamento');
	}



	function busca() {

		$busca = $this->input->post('busca');
		$termo = $busca['termo'];
		$modo = $busca['modo'];

		if($termo !== FALSE && $termo != '')
		{
			$this->data['busca']['termo'] = $termo;
			$this->data['busca']['modo'] = $modo;
			$this->_lista($this->equipamento_model->get($modo, $termo));
		}
		else
		{
			redirect('equipamento');
		}
	}


	function get_plain_data()
	{	
		$modelo = $this->input->post('modelo');

		if(!$modelo) return;

		$equip = $this->equipamento_model->get('modelo', $modelo, TRUE);

		if(count($equip) > 0)
		{
			echo $equip[0]['fabricante']."\n".$equip[0]['descricao'];
		}
		else
		{
			echo " \n ";
		}
	}

	function get_modelos()
	{
		if(!$this->input->post('fabricante')) return;

		$fab = $this->input->post('fabricante');

		$equips = $this->equipamento_model->get('fabricante', $fab, TRUE);

		$doc = new DOMDocument();
		$doc->formatOutput = true;

		$r = $doc->createElement( "equipamentos" );
		$doc->appendChild( $r ); 

		foreach ($equips as $e)
		{
			$eq = $doc->createElement("equipamento");
			$eq->appendChild($doc->createElement("modelo", $e['modelo']));
			$eq->appendChild($doc->createElement("descricao", $e['descricao']));
			$r->appendChild($eq);
		}

		header("Content-type: text/xml");
		echo $doc->saveXML();
	}


	function detalha($modelo = NULL)
	{
		if(!$modelo) redirect('equipamento');

		$modelo = str_replace("_", " ", $modelo);

		$equip = $this->equipamento_model->get('modelo', $modelo, TRUE)[0];

		$this->data['modelo'] = $modelo;
		$this->data['fabricante'] = $equip['fabricante'];
		$this->data['descricao'] = $equip['descricao'];

		$this->data['title'] = "Detalhe de equipamento";

		$patrims = $this->patrimonio_model->get('modelo', $modelo);

		foreach ($patrims as &$p) {
			$p['ambiente'] = $this->ambiente_model->get($p['ambiente'])['nome'];
		}


		$this->data['patrimonios'] = $patrims;

		$this->twiggy->set($this->data)->display('equipamento/detalha');



	}
}

/* End of file equipamento.php */
/* Location: ./application/controllers/cadastro/equipamento.php */