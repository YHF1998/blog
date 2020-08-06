<?php

namespace app\admin\controller;

use app\admin\controller\Base;
// use think\Controller;
use think\Facade\Session;


class Index extends Base
{
    public function index()
    {

        $this->assign('user_name', Session::get('user.user_name'));
        return $this->fetch('Index/index');
//        return $this->siteName;
    }

    public function welcome()
    {
        return $this->fetch('Index/welcome');
    }



}
