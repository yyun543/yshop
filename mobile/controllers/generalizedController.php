<?php
/**
Author:zhoulin
Date:2017/6/11

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class generalizedController extends \yphp{

    use view;


    public function generalized()
    {
        //我的推广
        $this->display('generalized/generalized.html');
    }
    public function generalizedOld()
    {
        //推广明细
        $this->display('generalized/generalized-old.html');
    }
    


}