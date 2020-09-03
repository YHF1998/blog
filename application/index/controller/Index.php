<?php

namespace app\index\controller;

use app\index\controller\Base;
use app\facade\Test;
use think\facade\Env;

//use think\db\Where;

class Index extends Base
{
    public function index()
    {
        //dump(Env::get('root_path'));
        //exit;
		return '我说这是666，谁来都拦不住';
        return $this->fetch();
        //return Test::test('xxxx');
    }


}
