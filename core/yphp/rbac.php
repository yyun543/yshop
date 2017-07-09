<?php
/*
* RBAC权限控制类
*/
namespace yphp;

use yphp\model;
class rbac
{
    public $config = [];
    public function __construct($config){
        // 初始化RBAC配置
        $this->config = $config;
    }
    // 登录判断
    public function isLogin()
    {
        $auth_key = $this->config['RBAC_AUTH_KEY'];
        $auth_flg = true;
        // 循环验证配置项
        foreach ($auth_key as $value) {
            $auth_res = \yphp\session::get($value);
            $auth_flg = $auth_flg && !empty($auth_res);
        }
        return $auth_flg;
    }

    // 权限验证
    public function verify()
    {
        $uid = \yphp\session::get($this->config['RBAC_AUTH_KEY'][0]);
        // 判断是否是超级管理员
        if($this->isSuperUser($uid)){
            return true;
        }else{
            // 具体验证控制器和方法
            $model = new model();
            // 根据实时验证进行判断并决定是否缓存
            if($this->config['RBAC_TYPE']||empty($_SESSION['rbac_menu'])){
                // 防注入处理
                $uid = $model->quote($uid);
                $sql = 'SELECT distinct node_id,controller,action,`status` from ys_rbac_u_node_view WHERE user_id ='.$uid.' and `status` =1';
                $res_arr = $model->query($sql)->fetchAll();
                $_SESSION['rbac_menu'] = $res_arr;
            }
            // 开始验证
            $node_flg = false;
            foreach ($_SESSION['rbac_menu'] as $value) {
                $flg_a = in_array(CONTROLLER,$value);
                $flg_b = in_array(ACTION,$value);
                $node_flg = $node_flg || ($flg_a && $flg_b);
            }

            return $node_flg;
        }
        
    }
    // 获取某个用户的所有节点
    public function getUserNode($uid)
    {
        $model = new model();
        // FIXME 为了提高开发效率暂时写死ys_rbac_u_node_view视图，修改表名以后请及时修正
        // 防注入处理
        $uid = $model->quote($uid);
        $sql = 'SELECT distinct node_id as id,pid,menu_name as name,controller,action,icon,`status`,sort from ys_rbac_u_node_view WHERE user_id ='.$uid.' ORDER BY sort ASC';
        $res_arr = $model->query($sql)->fetchAll();
        // 将数组转换成多维的树形结构
        $tree = $this->getTreeArr($res_arr);

        return $tree;

    }
    // 获取用户所有角色信息
    public function getUserRoleInfo($uid)
    {
        $model = new model();
        $table = $this->config['RBAC_RUSER_TABLE'];
        $join = [
            "[>]".$this->config['RBAC_ROLE_TABLE'] => ["role_id" => "id"],
        ];
        $columns = [
            'role_id',
            'user_id',
            'name',
            'pid',
            'status',
            'remark',
        ];
        $where = [
            'user_id'=>$uid,
        ];
        $res_arr = $model->select($table ,$join ,$columns ,$where );
        return $res_arr;
    }
    // 获取系统所有节点信息(多维数组)，以层级显示
    public function getLevelNode()
    {
        $model = new model();
        $table = $this->config['RBAC_NODE_TABLE'];
        $columns = '*';
        $where = [
            "ORDER" => [
                "sort" => "ASC"
            ],
        ];
        $res_arr1 = $model->select($table ,$columns ,$where );
        // 将数组转换成多维的树形结构
        $tree = $this->getTreeArr($res_arr1);

        return $tree;
    }
    // 验证是否是超级管理员
    public function isSuperUser($uid)
    {
        return in_array($uid,$this->config['SUPER_USER']);
    }

    // 创建树状数组
    public function getTreeArr($list)
    {
        $tree = [];
        // 第一步，将分类id作为数组key,并创建children单元
        foreach($list as $category){
            $tree[$category['id']] = $category;
            $tree[$category['id']]['children'] = [];
        }
        // 第二步，利用引用，将每个分类添加到父类children数组中，这样一次遍历即可形成树形结构。
        foreach ($tree as $k=>$item) {
            if ($item['pid'] != 0) {
                $tree[$item['pid']]['children'][] = &$tree[$k];
            }
        }
        // 第三步，移除不需要的元素
        foreach ($tree as $k=>$item) {
            if ($item['pid'] != 0) {
                unset($tree[$item['id']]);
            }
        }
        return $tree;
    }
}