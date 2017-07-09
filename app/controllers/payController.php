<?php
/*
* 支付控制器
 */
namespace app\controllers;

use yphp\view;
use app\models;
class payController extends \yphp
{
	use view;
	/*
	* 支付页面
	 */
    public function index()
    {
        // TODO
        $this->display('pay/index.html');
    }
}
