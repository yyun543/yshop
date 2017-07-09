<?php
/**
 * Created by PhpStorm.
 * User: LIMON
 * Date: 2017/6/11
 * Time: 17:16
 */
/**
 * 关于退款退货的
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class afterserviceController extends \yphp
{
    use view;
    /*
    * index方法
    */
    public function refundDetail()
    {
        //退款详情
        $this->display('member/member_refund_detail.html');
    }

    public function returnDetail()
    {
        //退货详情
        $this->display('member/member_return_detail.html');
    }

    public function returnRefund()
    {
        //退款及退货详情
        $this->display('member/member_return+refund.html');
    }

       public function complaints()
    {


        // 投诉
        $this->display('complaints/complaints.html');
    }

}