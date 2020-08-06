<?php

namespace app\http\middleware;

use think\Controller;
use think\facade\Session;

class Check extends Controller
{
    public function handle($request, \Closure $next)
    {
        //$request->header();
        if (!Session::has('user.user_name')) {
//            return $next->fetch('admin/Login/index');
            return redirect('admin/Login/index');
        } else {
            return $next($request);
        }

    }
}
