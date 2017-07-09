<?php
namespace app\controllers;
use yphp\view;
use app\models;
class assetsController extends \yphp
{
    use view;
    public function bill()
    {
        //账单
        $this->display('assets/bill.html');
    }
    public function bonus()
    {
        //红包
        $this->display('assets/bonus.html');
    }
    public function walletlist()
    {
        //账单明细
        $this->display('assets/walletlist.html');
    }
}
