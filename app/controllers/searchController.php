<?php
namespace app\controllers;

use yphp\view;
use app\models;
class searchController extends \yphp
{
	use view;
    public function index()
    {
        // TODO
        $this->display('search/index.html');
    }
}

