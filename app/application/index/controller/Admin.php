<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\User;
use app\index\model\Question;
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
            //$data = json_decode(input('param.json'));
            $str = 
<<<EOT
[
    {
        "type":"input",
        "msg":"这是一个问答题",
        "answer":[

        ],
        "required":1,
        "ishow":false
    },
    {
        "type":"radio",
        "msg":"请问你是那届的",
        "answer":[
            "2014",
            "2015",
            "2016",
            "2017"
        ],
        "required":1,
        "ishow":false
    },
    {
        "type":"checkbox",
        "msg":"请选择你喜欢的方向",
        "answer":[
            "伪娘",
            "秀吉",
            "扶她"
        ],
        "required":1,
        "ishow":false
    }
]
EOT;
            $data = json_decode($str,true);
            dump($data);
            //$clubid = session('club.id');
            $clubid = 1;
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
            $this->success("添加成功，新增{$re}个问题，删除{$del}个问题",'admin/question');
       // }else{
       //     return $this->error('无传入数据');
       // }
    }

    public function data(){
        return $this->fetch();
    }
}
