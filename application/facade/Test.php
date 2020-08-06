<?php
/**
 *Create By : Ye Haofeng
 *Date : 2020/7/26
 *Time : 16:31
 **/


namespace app\facade;

use think\Facade;

class Test extends Facade
{

    protected static function getFacadeClass()
    {
        return 'app\index\controller\Test';
    }

}