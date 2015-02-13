<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Form_validation extends CI_Form_validation
{

	function __construct()
	{
		parent::__construct();
		$this->set_error_delimiters('<div class="alert alert-danger">', '</div>');
	}

}

/* End of file MY_Form_validation.php */