<?php
/**
 * Created by PhpStorm.
 * Auther: hqq520
 * Name: 管理收货控制器
 * Date: 2017/6/11
 * Time: 17:39
 */

/**
 * 管理收货控制器
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class addressController extends \yphp
{
    use view;
    /*
    * 管理收货地址页面
    */
    public function address()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('address/address.html');
    }

    /*
       * 增加收货地址页面
       */
    public function add()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('address/add.html');
    }

    /*
       * 管理收货地址页面
       */
    public function adress()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('address/adress.html');
    }

    /*
       * 管理空收货地址页面
       */
    public function adressEmpty()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('address/adressEmpty.html');
    }
}