<?php
/**
 * Author:zhoulin
 * date:2017/6/20 16:26
 */
namespace app\controllers;

use yphp\view;
use app\models;
class onLineServiceController extends \yphp
{
    use view;
     /*
    * 设置初始化画面
    */
    public function index()
    {

        
        $this->display('onLineService/suggest.html');
    }
    /*
    * 商品咨询
    */
    public function suggest()
    {

    	
        $this->display('onLineService/suggest.html');
    }
     /*
    * 意见反馈
    */
    public function  consultation()
    {

        
        $this->display('onLineService/consultation.html');
    }
     /*
    * 我的消息
    */
    public function news()
    {

        
        $this->display('onLineService/news.html');
    }


}

