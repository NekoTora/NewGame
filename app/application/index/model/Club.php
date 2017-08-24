<?php
namespace app\index\model;

use think\Model;

class Club extends Model
{
    //获取社团列表
    static public function list(){
        return self::where('status',1)->field('id,name,img_logo,status,signup,sort')->select();
    }

    //获取社团信息
    static public function info($id){
        return self::where('id',$id)->field('id,name,img_logo,status,signup,sort')->find();
    }

    //社团是否开通纳新通道并可以纳新
    static public function check($id){
        $club = self::where('id',$id)->find();
        if(empty($club)) return ['status'=>'error','msg'=>"社团不存在"];
        if($club->status != 1) return ['status'=>'error','msg'=>"社团暂时无法访问"];
        if($club->signup != 1) return ['status'=>'error','msg'=>"社团未开始纳新"];
        return true;
    }
}