<?php
/**
 * Created by PhpStorm.
 * Auther: yyb
 * name: 全部分类
 * Date: 2017/6/11
 * Time: 16:00
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class allCategoriesController extends \yphp
{
    use view;
    public function allClassify()
    {


        // 全部分类（一级，二级）
        $this->display('allCategories/allClassify.html');
    }
    public function allClassifybak()
    {


        // 全部分类（热门，休闲等）
        $this->display('allCategories/allClassifybak.html');
    }


}