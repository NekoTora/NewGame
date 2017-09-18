<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\Apply;
use app\index\model\ApplyContent;
use app\index\model\Question;
class Gate extends \think\Controller
{

    public function index(){
        return $this->display('喵喵喵！汪汪汪！<br>你要做什么？');
    }
    
    //   index/gate/apply?club=1
    public function apply(){
        $id = input('param.club/d');
        $check = Club::check($id);
        if($check!==true) $this->error($check['msg']);

        $club = Club::info($id);
        $qes = Question::list($id);

        $this->assign('club',$club);
        $this->assign('qes',$qes);

        return $this->fetch();
    }

    public function get_apply(){
        $clubid = input('param.club/d');
        $qes = input('param.qes/a');
        $check = Club::check($clubid);
        if($check!==true) $this->error($check['msg']);
        //先检查一遍申请
        foreach ($qes as $id => $item) {
            $question = Question::getSingle($id);
            if(empty($question)) $this->error("问题$id不存在");
            if($question->club_id != $clubid) $this->error("问题$id无法提交");
            if($question->required == 1 && empty($item)) $this->error("问题“".$question->msg."”不能为空");
        }
        //新建申请
        $apply = new Apply();
        $apply->club_id = $clubid;
        $apply->status = 0;
        $apply->user_id = 0;
        $apply->mark = 0;
        $apply->save();
        if($apply->id < 0) $this->error("apply储存失败");
        //储存问题
        foreach ($qes as $id => $item) {
            $question = Question::getSingle($id);
            $content = new ApplyContent();
            $content->apply_id = $apply->id;
            $content->question_id = $question->id;
            $content->question = $question->msg;
            $content->type = $question->type;
            if(is_array($item)) $item = implode(' ; ',$item);
            $content->answer = $item;
            $cid = $content->save();
            if($cid < 0) $this->error("问题$id储存失败");
        }
        $this->success('提交成功');
    }
}