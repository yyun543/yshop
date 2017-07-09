<?php
/*
 * @author:lcf
 * @我的积分
 * @time:2017/06/10/16:55
 * */
namespace app\controllers;

use yphp\view;
use app\models;
class pointsController extends \yphp
{
    use view;
    public function points()
    {
        //put some
        $this->display('assets/points.html');

    }
}
