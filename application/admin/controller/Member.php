<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Member extends Base
{
    /**
     * 显示资源列表---
     *
     * @return \think\Response
     */
    public function index()
    {
        //获取会员列表数据信息
        //$list = \app\common\model\Member::where('is_disable', 0)->paginate(2);
        $list = \app\common\model\Member::paginate(2);
        //赋值
        $this->assign('lists', $list);
        //返回
        return $this->fetch('list');
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        return $this->fetch();
    }

    /**
     * 保存新建的资源
     *
     * @param \think\Request $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //

        $params = $request->post();
        //dump($params);
        //exit;
        $res = $this->validate($params, [
            'email|邮箱'     => ['require', 'email', 'unique:member'],
            'nick_name|昵称' => ['require', 'max' => '100'],
            'phone|手机号'    => ['require', 'mobile'],
            'password|密码'  => ['require', 'regex' => '/^[0-9a-z_$]{6,16}$/i'],
            'sex|性别'       => 'require'
        ]);
        //验证失败
        if (true !== $res) {
            $this->fail($res);
        }

        //验证成功
        $params['password'] = enctype_password($params['password']);
        //新增数据
        $info = \app\common\model\Member::create($params);
        //返回新增数据
        $this->ok($info, 200, '新增成功');


    }

    /**
     * 显示指定的资源
     *
     * @param int $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param int $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param \think\Request $request
     * @param int $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        $params = $request->param();
        //判断类型
        if ($params['type'] == 'repass') {
            //更新密码
            $params['password'] = enctype_password($params['password']);
        }


        $info = \app\common\model\Member::update($params);
        $this->ok($info);
    }

    /**
     * 删除指定资源
     *
     * @param int $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }

    //查看修改密码页面
    public function password($id)
    {

        $info = \app\common\model\Member::get($id);
        $this->assign('info', $info);
        return $this->fetch();
    }

}
