<?php
/*
* 订单控制器
 */
namespace app\controllers;

use yphp\view;
use app\models;
class ordersController extends \yphp
{
	use view;
	/*
	* 下单成功
	 */
    public function success()
    {
        // TODO
        $this->display('orders/success.html');
    }
}
