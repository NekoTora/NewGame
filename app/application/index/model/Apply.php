<?
namespace app\index\model;

use think\Model;

class Apply extends Model
{
    //按社团获取纳新表单
    static public function listByClub($id){
        $list = self::where('club_id',$id)
                        ->where('status',0)
                        ->where('mark',0)
                        ->order('id desc')
                        ->select();
        return $list;
    }
}