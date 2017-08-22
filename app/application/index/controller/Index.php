<?php
namespace app\index\controller;

class Index extends \think\Controller
{
    public function index()
    {
        return $view->fetch();
    }
}
