<?php
/**
 * Created by PhpStorm.
 * User: LIMON
 * Date: 2017/6/11
 * Time: 17:55
 *
*
 * 关于消息的
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class messageController extends \yphp
{
    use view;
    /*
    * index方法
    */
    public function message()
    {
        //消息详情
        $this->display('message/message.html');
    }

    public function messageEmpty()
    {
        //空白消息
        $this->display('message/message_empty.html');
    }

}