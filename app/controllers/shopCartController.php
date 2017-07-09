<?php
/*
* 购物车控制器
 */
namespace app\controllers;

use yphp\view;
use app\models;
class shopCartController extends \yphp
{
	use view;
	/*
	* 购物车
	 */
    public function index()
    {
    	// TODO
        $this->display('shopCart/index.html');
    }
}
