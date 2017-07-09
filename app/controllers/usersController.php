<?php
/*
* @Auther:BugLi
* @name:用户中心控制器
* @date:2017/06/10 15:25
 */
namespace app\controllers;

use yphp\view;
use app\models;
class usersController extends \yphp
{
	use view;
    /**
    * 用户中心首页
     */
    public function index()
    {
        // TODO
        $this->display('users/index.html');
    }
	/**
	* 用户注册方法
	 */
    public function register()
    {
        // TODO
        $this->display('users/register.html');
    }
    /**
    * 用户登录方法
     */
    public function login()
    {
    	// TODO
    	$this->display('users/login.html');
    }
    /*
    * 用户个人信息方法
     */
    public function information()
    {
        // TODO
        $this->display('users/information.html');
    }
    /*
    * 用户安全信息方法
     */
    public function safety()
    {
        // TODO
        $this->display('users/safety.html');
    }
    /*
    * 用户地址管理方法
    *
     */
    public function address()
    {
        // TODO
        $this->display('users/address.html');
    }

    public function cardlist()
    {
        //TODO
        /**
    * 快捷支付
     */
        $this->display('users/cardlist.html');
    }

}
