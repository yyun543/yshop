<?php
namespace app\controllers;

use yphp\view;
use app\models;
class productController extends \yphp
{
	use view;
    public function index()
    {
    	// TODO
        $this->display('product/index.html');
    }
}
