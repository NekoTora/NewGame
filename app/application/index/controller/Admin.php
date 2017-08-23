<?php
namespace app\index\controller;

class Admin extends \think\Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
