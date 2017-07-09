<?php
/**
 * 特权卡控制器
 * author: qy
 * Date: 2017/6/12
 * Time: 14:49
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class privilegeController extends \yphp{

    use view;


    public function privilege()
    {
        /*
     * 特权卡
     */
        // TODO
        $this->display('privilege/privilege.html');
    }

    public function privilegeItem()
    {
        /*
    * 御池园SPA温泉酒店
    */
        // TODO
        $this->display('privilege/privilege_item.html');
    }



}