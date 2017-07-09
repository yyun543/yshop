<?php
/**
Author:zhoulin
Date:2017/6/11

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class logisticsController extends \yphp{

    use view;


    public function logistics()
    {
        //我的物流
        $this->display('logistics/logistics.html');
    }
    public function logisticsEmpty()
    {
        //暂无物流信息
        $this->display('logistics/logistics_empty.html');
    }


    

}