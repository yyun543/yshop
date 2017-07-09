<?php
/**
Author:zhoulin
Date:2017/6/11

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class loginController extends \yphp{

    use view;


    public function login()
    {
        //登录
        $this->display('login/login.html');
    }

    public function index()
    {
        
        $this->display('login/login.html');
    }


}