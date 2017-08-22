<?
namespace app\index\model;

use think\Model;

class Question extends Model
{
    static public function list($id){
        $list = self::where('club_id',$id)
                        ->where('status',1)
                        ->order('sort')
                        ->select();
        return $list;
    }
}