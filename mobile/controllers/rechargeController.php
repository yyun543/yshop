<?php
/**
 * 充值消费
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class rechargeController extends \yphp
{
    use view;
    public function chargeSuc()
    {


        // 充值
        $this->display('recharge/chargeSuc.html');
    }
    public function checkDetail()
    {


        // 消费明细
        $this->display('recharge/checkDetail.html');
    }


}