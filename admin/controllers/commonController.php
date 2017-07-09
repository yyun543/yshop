<?php
/*
* 公用控制器
 */
namespace admin\controllers;

use yphp\view;
use admin\models;
use yphp\conf;
class commonController extends \yphp
{
	use view;
	// 公用构造方法
	public function __construct()
	{
		$config = \yphp\conf::all('rbac');
		$rbac_obj = new \yphp\rbac($config);

		if($rbac_obj->isLogin()){
			if(!$rbac_obj->verify()){
				P('权限不足，请联系超级管理员。');
				die();
			}
			$uid = $_SESSION['uid'];
			
		}else{
			P('请先登录后再使用');
			redirect('/login');
			die();
		}
		// 如果是超级管理员则获取全部菜单
		if($rbac_obj->isSuperUser($uid)){
			$menu = $rbac_obj->getLevelNode();
		}else{
			$menu = $rbac_obj->getUserNode($uid);
		}
		// 设置用户登录信息
		if(!empty($_SESSION['uid'])&&!empty($_SESSION['uname'])){
			$user_data = [
				'uid'=>$_SESSION['uid'],
				'uname'=>$_SESSION['uname'],
				'avatar'=>$_SESSION['avatar'],
			];
			$this->assign('user_data',$user_data);
		}
		// P($menu);die();
		$this->assign('menu',$menu);
	}
}
