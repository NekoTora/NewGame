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
        //if (request()->isPost()){
            $data = json_decode(input('param.data'),true);
            $clubid = input('param.club/d');
            //检查编辑的社团是不是自己的社团
            $userid = 1;
            if(!User::isManager($userid,$clubid)) return json(['status'=>'error','msg'=>'喵喵喵你不是这个组织的管理员，你想干嘛？']);
            //清空问题
            $del = Question::where('club_id',$clubid)->delete();
            //循环获取问题
            foreach ($data as $key => $question) {
                $item = new Question();
                $item->club_id = $clubid;
                $item->msg = $question['msg'];
                $item->type = $question['type'];
                $item->msg = $question['msg'];
                $item->required = $question['required'];
                $item->sort = 0;
                $item->status = 1;
                switch ($question['type']) {
                    case 'select':
                    case 'radio':
                    case 'checkbox':
                    $item->answer = json_encode($question['answer'],JSON_UNESCAPED_UNICODE);
                        break;
                    
                    default:
                    $item->answer = '';
                        break;
                }
                $re = $item->save();
                if(!$re>0) $this->error("问题$key添加失败");
            }
            $re = count($data);
            return json(['status'=>'success','msg'=>"添加成功，新增{$re}个问题，删除{$del}个问题"]);
       // }else{
       //     return $this->error('无传入数据');
       // }
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
