<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\Question;
class Api extends \think\Controller
{

    public function clubList(){
        $club = Club::list();
        return json($club);
    }

    //   /api/form?club=1
    public function clubForm(){
        $id = input('param.club');
        $check = Club::check($id);
        if($check!==true) return $check;

        $club = Club::info($id);
        $qes = Question::list($id);

        $re = ["club"=>$club,"formlist"=>$qes];

        return json($re);
    }

    //   /api/
    public function clubApply()
    {
    	$input = json_decode(input('param.json'));
    	foreach ($input as $key => $item) {
    		//
    	}

        return $view->fetch();
    } 

}
