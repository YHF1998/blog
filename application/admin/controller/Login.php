<?php
/**
 *Create By : Cyb001
 *Date : 2019/12/7
 *Time : 12:13
 **/

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\captcha\Captcha;
use think\facade\Session;
use app\admin\model\User as UserModel;

class Login extends Controller
{
    //登录
    public function index()
    {
        //echo sha1('qqq714326675');
        //exit;
        if (Session::has('user.user_id')) {

            return redirect('admin/Index/index');
        } else {
            return $this->fetch('Login/index');
        }
    }

    //检查登录信息
    public function check(Request $request)
    {
        $data = $request->post();

        $validate = new \app\admin\validate\Login;

        if (!$validate->check($data)) {

            $msg = array('Status' => 0, 'msg' => $validate->getError());
            return json($msg);

        } else {
            $user = UserModel::where('user_name', $data['username'])
                ->where('password', sha1($data['password']))
                ->find();
//            dump($user);
            if ($user) {

                Session::set('user.user_name', $user->nick_name);
                Session::set('user.user_id', $user->user_id);
                $msg = array('Status' => 1, 'msg' => '登录成功');
                return json($msg);

            } else {

                $msg = array('Status' => 0, 'msg' => '用户名或密码错误');
                return json($msg);
            }


        }

    }

    //注销
    public function loginOut()
    {
        Session::clear();
        $response           = array();
        $response['Status'] = 1;
        $response['msg']    = '退出成功,即将返回登录页';
        return json($response);

    }

    //验证码
    public function verify()
    {
        $config  = [
            // 验证码字体大小
            'fontSize' => 32,
            // 验证码位数
            'length'   => 4,
            // 关闭验证码杂点
            'useNoise' => false,
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();

    }


}