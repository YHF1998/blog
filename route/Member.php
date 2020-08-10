<?php
/**
 *Create By : Ye
 *Date : 2020/8/6
 *Time : 21:58
 **/

use think\facade\Route;

Route::resource('member', 'admin/Member');

Route::any('member/password', 'admin/Member/password');