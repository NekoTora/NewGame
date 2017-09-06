<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\User;
use app\index\model\Question;
use app\index\model\Apply;
use app\index\model\ApplyContent;
class Admin extends \think\Controller
{
    //前置操作
    protected $beforeActionList = [
        //'checklogin' =>  ['except'=>'login']
    ];

    public function index(){
        return $this->fetch();
    }

    public function checklogin(){
        if(empty(session('user'))){
            $this->error('请先登录','admin/login');
        }
    }

    public function login(){
        if (request()->isPost()){
            if(empty(input('param.username')||empty(input('param.password'))))
                $this->error('用户名密码不能为空');
            $user = (new User())->where('username',input('param.username'))->find();
            if(empty($user)||$user->password!==input('param.password')){
                $this->error("用户名或密码错误");
            }else{
                session('user',$user);
                $this->sucess("登陆成功","admin/index");
            }
        }else{
            return $this->fetch();
        };
    }

    public function toggleOpen(){
        //
    }

    public function test(){
        session('club.id',1);
        dump(session(''));
    }

    public function club(){
        $id = session('club.id');
        if (request()->isPost()){
            $club = new Club();
            dump(input('param.'));
            $re = $club->allowField(['name','intro','email'])->save(input('param.'), ['id' => $id]);
            $re>0 ? $this->success('更新成功') : $this->error('更新失败');
        }else{
            //社团信息
            $club = (new Club())->find($id);
            $this->assign('club',$club);
            return $this->fetch();
        }
    }

    public function question(){
        return $this->fetch();
    }

    public function update_question(){
        $count = ['add'=>0,'mod'=>0,'del'=>0];
        //if (!request()->isPost()){}
        $data = json_decode(input('param.data'),true);
        if(empty($data)) return json(['status'=>'error','msg'=>'空空空！崩崩崩！']);
//         $data = 
// <<<EOF
// [{"id":122,"type":"select","msg":"测试下拉框","answer":["123","345"],"required":1,"ishow":false},{"id":123,"type":"radio","msg":"请问你是那届的","answer":["2014","2015","2016","2017"],"required":1,"ishow":false},{"id":124,"type":"checkbox","msg":"请选择你喜欢的方向","answer":["伪娘","秀吉","扶她"],"required":1,"ishow":false},{"id":125,"type":"input","msg":"这是一个问答题","answer":[],"required":1,"ishow":false}]
// EOF;
        //$data = json_decode($data,true);
        $clubid = input('param.club/d');
        //检查编辑的社团是不是自己的社团
        $userid = 1;
        if(!User::isManager($userid,$clubid)) return json(['status'=>'error','msg'=>'喵喵喵你不是这个组织的管理员，你想干嘛？']);
        
        //$qeslist = collection(Question::list($clubid))->toArray();

        $qeslist = Question::list($clubid);
        
        //循环获取问题
        foreach ($data as $key => $question) {
            $oldqes = '';
            //循环比较之前有没有这个问题
            foreach($qeslist as $k => $qes){
                if($question['id']==$qes['id']){
                    $oldqes = $qes;
                    unset($qeslist[$k]);
                    break;
                }
            }
            $list['club_id'] = $clubid;
            $list['msg'] = $question['msg'];
            $list['type'] = $question['type'];
            $list['msg'] = $question['msg'];
            $list['required'] = $question['required'];
            $list['sort'] = $question['sort'];
            $list['status'] = 1;
            switch ($question['type']) {
                case 'select':
                case 'radio':
                case 'checkbox':
                $list['answer'] = json_encode($question['answer'],JSON_UNESCAPED_UNICODE);
                    break;
                default:
                $list['answer'] = '';
                    break;
            }
            $item = new Question();
            if(empty($oldqes)){
                //新增问题
                $count['add'] ++;
                $re = $item->save($list);
            }else{
                //修改问题
                $count['mod'] ++;
                $re = $item->save($list,['id'=>$question['id']]);
            }
        }
        foreach ($qeslist as $key => $delitem) {
            $del = Question::where('id',$delitem['id'])->delete();
            if(!$del>0) $this->error("问题{$delitem['id']}删除失败");
            $count['del'] ++;
        }
        return json(['status'=>'success','msg'=>"新增{$count['add']}个问题，修改{$count['mod']}个问题，删除{$count['del']}个问题"]);
    }

    public function data(){
        $clubid = 1;
        $question = Question::list($clubid);
        //循环过滤不需要回答的问题
        foreach ($question as $key => $item) {
            if($item->type == 'text') unset($question[$key]);
        }
        $apply = Apply::listByClub($clubid);
        $apply_num = count($apply);
        foreach ($apply as $keya => $app) {
            $data[$keya] = [];
            $data[$keya]['id'] = $app->id;
            $data[$keya]['time'] = $app->create_time;
            foreach ($question as $keyq => $que) {
                $content = (new ApplyContent)->where('apply_id',$app->id)->where('question_id',$que->id)->find();
                empty($content->answer) ? $answer = '' : $answer = $content->answer;
                $data[$keya]['data'][$keyq] = $answer;
            }
        }
        $this->assign('question',$question);
        $this->assign('data',$data);
        $this->assign('num',$apply_num);
        return $this->fetch();
    }
}
