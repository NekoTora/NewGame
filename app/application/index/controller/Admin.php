<?php
namespace app\index\controller;

class Admin extends \think\Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function club()
    {
        return $this->fetch();
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
