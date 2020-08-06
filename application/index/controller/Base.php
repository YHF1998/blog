<?php

namespace app\index\controller;
class Base extends \think\Controller
{
//   protected $siteName = 'PHP中文网';
//   protected function test()
//   {
//     return '欢迎来到'.$this->siteName.'学习thinkphp5开发技术';
//   }
    protected $beforeActionList = [
        'isLogin' => ['only' => 'login']
    ];

    public function isLogin()
    {

    }


}