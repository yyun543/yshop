<?php
/**
 * 手机版商城首页控制器
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class indexController extends \yphp
{
    use view;
    /*
    * index方法
    */
    public function index()
    {

        // TODO
        $this->assign('title','YSHOP手机端前台');

        // 渲染前台首页模板
        $this->display('index/index.html');
    }


}