<?php
/**
 * 购物车
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class shoppingCartController extends \yphp
{
    use view;
    public function cart()
    {
        // 我的购物车（有商品）
        $this->display('shoppingCart/cart.html');
    }
    public function cartEmpty()
    {
        // 我的购物车（空）
        $this->display('shoppingCart/cartEmpty.html');
    }

}