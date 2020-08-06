<?php
/**
 *Create By : Ye Haofeng
 *Date : 2019/12/11
 *Time : 22:44
 **/

namespace app\admin\controller;

use app\admin\controller\Base;
use app\common\model\Category as CategoryModel;
use think\Controller;
use think\Facade\Session;
use think\Request;


class Category extends Base
{

    /*
     * 列表页
     */
    public function list()
    {
        $cate = new CategoryModel();
        $list = $cate->getCate();
        // $list = CategoryModel::getCate();
        // dump($list);exit;
        $this->assign('list', $list);
        //return $this->fetch('Index/category');
        return $this->fetch('category');

    }

    public function addCate(Request $request)
    {
        $data                       = $request->post();
        $categoryModel              = new CategoryModel();
        $categoryModel->cate_name   = $data['cateName'];
        $categoryModel->order_by    = $data['orderBy'];
        $categoryModel->superior_id = $data['pid'];
        $categoryModel->create_by   = Session::get('user.user_id');
        $categoryModel->create_time = time();

        if ($categoryModel->save()) {
            return json(['msg' => '添加分类成功', 'Status' => 1]);
        } else {
            return json(['msg' => '添加分类失败,请重试', 'Status' => 0]);
        }

    }

    public function addSonCate(Request $request)
    {
        $data = $request->post();
    }

    public function cateAdd()
    {
        return $this->fetch('Category/cateadd');
    }
}
