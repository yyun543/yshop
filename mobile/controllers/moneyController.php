<?php
/**
 * Created by PhpStorm.
 * User: LIMON
 * Date: 2017/6/11
 * Time: 18:04
 */

namespace mobile\controllers;

use yphp\view;
use mobile\models;
class moneyController extends \yphp
{
    use view;

    /*
    * index方法
    */
    public function money()
    {
        //余额
        $this->display('money/money.html');
    }

    public function myLeMoney()
    {
        //我的乐币
        $this->display('money/myLeMoney.html');
    }
}
