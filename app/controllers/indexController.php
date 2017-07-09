<?php
/**
 * 商城首页控制器
 */
namespace app\controllers;

use yphp\view;
use app\models;
class indexController extends \yphp
{
    use view;
    /*
    * index方法
    */
    public function index()
    {

    	// TODO
    	$this->assign('title','YSHOP商城前台');

        // 渲染前台首页模板
        $this->display('index/index.html');
    }


}

