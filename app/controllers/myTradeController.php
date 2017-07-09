<?php
/**
 * @Auther:qy55357
 * @name:交易控制器
 * Date: 2017/6/10
 * Time: 16:38
 */

namespace app\controllers;

use yphp\view;
use app\models;

class myTradeController extends \yphp
{
    /**
     * 订单管理
     */
    use view;
    public function order()
    {
        // TODO
        $this->display('users/order.html');

    }
    /**
     * 退款售后
     */

    public function change()
    {
        // TODO
        $this->display('users/change.html');

    }




}