<?php
/**
 * Created by PhpStorm.
 * User: HQQ
 * Date: 2017/6/11
 * Time: 16:37
 */

/**
 * 商城首页控制器
 */
namespace app\controllers;

use yphp\view;
use app\models;
class collectionController extends \yphp
{
    use view;
    /*
    * collection方法
    */
    public function collection()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('collection/collection.html');
    }
    /*
       * foot方法
       */
    public function foot()
    {

        // TODO
        // 渲染前台首页模板
        $this->display('collection/foot.html');
    }

}

