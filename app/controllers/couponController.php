<?php
/*
 * @author:lcf
 * 优惠券
 * @time:2017/06/10/16:30
 * */
namespace app\controllers;

use yphp\view;
use app\models;
class couponController extends \yphp
{
    use view;
    public function coupon()
    {
        //put some
        $this->display('assets/coupon.html');
    }
}
