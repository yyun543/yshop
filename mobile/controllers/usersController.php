<?php
/*
* @name:用户中心控制器
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class usersController extends \yphp
{
	use view;
    /**
    * 用户中心
     */
    public function index()
    {
        // TODO
        $this->display('users/index.html');
    }

	/**
	* 用户注册方法
	 */
    public function registerCheck()
    {
        // TODO
        $this->display('users/register.html');
    }
    public function register1()
    {
        /*
     * 注册
      */
        // TODO
        $this->display('/register1.html');
    }
    public function registerSuccess()
    {
        // TODO
        $this->display('users/registerSuccess.html');
    }
    public function registerPerfect()
    {
        // TODO
        $this->display('users/registerPerfect.html');
    }
    /**
    *注册成功
    */
    public function loginSuccess()
    {
        // TODO
        $this->display('users/loginSuccess.html');
    }
    /**
    * 用户登录方法
     */
    public function login()
    {
    	// TODO
    	$this->display('users/login.html');
    }
     /**
    * 用户优惠券
     */
    public function coupon()
    {
        // TODO
        $this->display('users/coupon.html');
    }

    public function bxhl()
    {

        // 我的必馨互联
        $this->display('users/bxhl.html');
    }


}
