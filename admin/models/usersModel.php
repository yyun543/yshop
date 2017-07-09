<?php
/**
 * 示例模型
 */
namespace admin\models;

use yphp\model;
class usersModel
{
    public function checkLogin($uname)
    {
    	// 实例化模型
    	$model = new model();
    	// where条件
    	$where = [
    		'username'=>$uname,
    	];
    	$data = $model->select('ys_admin_users','*',$where);
    	return $data;
    }
}