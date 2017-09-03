<?php
namespace app\index\controller;
use app\index\model\Club;
use app\index\model\User;
class Admin extends \think\Controller
{
    //前置操作
    protected $beforeActionList = [
        //'checklogin' =>  ['except'=>'login']
    ];

    public function index()
    {
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

    public function question()
    {
        return $this->fetch();
    }

    public function data()
    {
        return $this->fetch();
    }
}
