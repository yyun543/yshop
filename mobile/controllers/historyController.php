<?php
/**
Author:zhoulin
Date:2017/6/11

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class historyController extends \yphp{

    use view;


    public function history()
    {
        //我的浏览记录
        $this->display('history/history.html');
    }
    public function historyEmpty()
    {
        //无浏览记录
        $this->display('history/history_empty.html');
    }



}