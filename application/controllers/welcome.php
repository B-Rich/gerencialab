<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	function index()
	{
		if (!$this->tank_auth->is_logged_in()) {
			redirect('/auth/login/');
		} else {
			$data['username'] = $this->tank_auth->get_username();
			$data['title'] = 'Página Inicial';
			$data['subtitle'] = 'Bem-vindo';
			
			$this->twiggy->set($data)->display();
		}
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */