<?php
/**
 * /**
 * Created by PhpStorm.
 * Auther: yyb
 * name: 我的收藏夹
 * Date: 2017/6/11
 * Time: 16:00
 */

namespace mobile\controllers;

use yphp\view;
use mobile\models;
class favoritesController extends \yphp
{
    use view;
    public function favorites()
    {


        // 收藏夹
        $this->display('favorites/favorites.html');
    }



}