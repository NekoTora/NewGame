<?php
namespace app\index\controller;

class Api
{
    public function apply()
    {
    	$input = json_decode(input('param.json'));
    	foreach ($input as $key => $item) {
    		//
    	}

        return $view->fetch();
    } 
}
