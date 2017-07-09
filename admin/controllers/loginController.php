<?php
/*
* 公用控制器
 */
namespace admin\controllers;

use yphp\view;
use admin\models;
class loginController extends \yphp
{
	use view;
	// 登录页
	public function index()
	{
		// TODO
		$this->display('login/index.html');
	}

	// 登录业务逻辑
	public function login()
	{
		// 接收post登录信息
		$uname = post('uname');
		$upwd = post('upwd');
		$remember = post('remember');
		// 实例化模型
		$u_obj = M('users');
		$res = $u_obj->checkLogin($uname);
		// 登录判断
		
		if(!empty($res) && password_verify($upwd,$res[0]['password'])){
			// 设置session
			\yphp\session::set('uid',$res[0]['id']);
			\yphp\session::set('uname',$res[0]['username']);
			\yphp\session::set('avatar',$res[0]['avatar']);
			P('登录成功');
			redirect('/index/index');

		}else{
			P('登录失败');
			redirect('/login');
		}

	}

	// 退出登录业务逻辑
	public function logout()
	{
		\yphp\session::clear();
		redirect('/login');
	}
}
