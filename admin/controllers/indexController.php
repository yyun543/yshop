<?php
/**
 * 示例控制器
 */
namespace admin\controllers;

use yphp\view;
use admin\models;
class indexController extends commonController
{
    use view;
    /*
    * index方法
    */
    public function index()
    {
        // 渲染后台首页模板
        $this->display('index/index.html');
    }

}

