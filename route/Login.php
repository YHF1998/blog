<?php
/**
 *Create By : Cyb001
 *Date : 2019/12/7
 *Time : 14:46
 **/

use think\facade\Route;

Route::any('code', 'admin/Login/verify');


Route::rule('hello', 'admin/Index/hello');