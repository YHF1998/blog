<?php
/**
 *Create By : Cyb001
 *Date : 2019/12/7
 *Time : 13:02
 **/


namespace app\admin\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule =   [
        'username'  => 'require|max:25',
        'password'   => 'require|min:10|max:18',
        'code|验证码'=>'require|captcha'
    ];

    protected $message  =   [
        'username.require' => '用户名不能为空',
        'username.max' => '用户名最多不能超过25个字符',
        'password.require' => '密码不能为空',
        'password.min' => '密码长度不能少于10个字符',
        'password.max' => '密码长度不能多于18个字符',
        'code.require' => '验证码不能为空',
        'code.captcha' => '验证码错误'
    ];

}