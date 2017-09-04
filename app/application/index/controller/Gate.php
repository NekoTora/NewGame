<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\Question;
class Gate extends \think\Controller
{
        //   index/gate/apply?club=1
        public function apply(){
            $id = input('param.club');
            $check = Club::check($id);
            if($check!==true) return $check;
    
            $club = Club::info($id);
            $qes = Question::list($id);
    
            $this->assign('club',$club);
            $this->assign('qes',$qes);
    
            return $this->fetch();
        }

        public function get_apply(){
            $id = input('param.club');
        }
}