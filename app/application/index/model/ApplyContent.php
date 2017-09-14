<?php
namespace app\index\model;

use think\Model;

class ApplyContent extends Model
{
    static public function list($applyid){
        return self::where('apply_id',$applyid)
                ->select();
    }
}