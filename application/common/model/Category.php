<?php

namespace app\common\model;

use think\Model;

class Category extends Model
{

    protected $pk = 'cate_id';

    //获取分类列表，并按无限极分类排序
    public function getCate()
    {
        //获取全部活跃内容
        $list = self::where('active', 1)->order('order_by', 'asc')->select();
        // 对结果集进行无限极分类排序
        // return $list;
        return $this->getCateTree($list);
        // return self::getCateTree($list);
    }

    protected function getCateTree($list, $pid = 0, $level = 0)
    {
        static $newList = [];
        foreach ($list as $key => $value) {
            if ($value["superior_id"] == $pid) {
                $value["level"] = $level;
                $newList[]      = $value;
                unset($list[$key]); //删除已经排好的数据为了减少遍历的次数，当然递归本身就很费神就是了
                $this->getCateTree($list, $value["cate_id"], $level + 1);
            }
        }

        return $newList;
    }
}
