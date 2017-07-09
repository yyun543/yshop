<?php
/*
* 订单控制器
 */
namespace admin\controllers;

use yphp\view;
use admin\models;
class ordersController extends commonController
{
	use view;
	/*
	* 下单成功
	 */
    public function index()
    {
        // TODO
        P('订单首页');
        // P(password_hash('666666',PASSWORD_DEFAULT));
    }

    public function add(){
    	P('添加订单');
    }
}
