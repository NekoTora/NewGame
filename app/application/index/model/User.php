<?
namespace app\index\model;

use think\Model;

class User extends Model
{
    static public function getSingle($id){
        return self::where('id',$id)
        ->find();
    }

    static public function isManager($userid,$clubid){
        $user = self::getSingle($userid);
        $club = explode(',',$user->manager_club);
        if(array_search($clubid,$club)===false) {
            return false;
        }else{
            return true;
        }
    }
}