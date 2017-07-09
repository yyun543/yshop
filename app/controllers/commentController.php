<?php
/*
 * @author:lcf
 * 评价商品
 * @time:2017/06/10/16:30
 * */
namespace app\controllers;

use yphp\view;
use app\models;
class commentController extends \yphp
{
    use view;
    public function comment()
    {
        //put some
        $this->display('users/comment.html');
    }
}
