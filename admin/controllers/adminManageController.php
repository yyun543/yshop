<?php
/**
 * 管理员管理控制器
 */
namespace admin\controllers;

use yphp\view;
use admin\models;
class adminManageController extends commonController
{
    use view;
    /*
    * 管理员列表方法
    */
    public function list()
    {
        // 渲染管理员列表模板
        $this->display('adminManage/list.html');
    }

    /*
    * 角色管理方法
    */
    public function role()
    {
    	// 渲染角色管理页面
        $this->display('adminManage/role.html');
    }

    /*
    * 权限管理方法
    */
    public function access()
    {

        // 渲染权限管理模板
        $this->display('adminManage/access.html');
    }
}

