<?php
namespace app\index\controller;
use app\index\model\Club;
class Index extends \think\Controller
{
    public function index()
    {
        $this->assign('club', Club::list());
        return $this->fetch();
    }

    public function install()
    {
        return $this->fetch();
    }
}
