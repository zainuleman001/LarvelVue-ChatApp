<?php

use App\Http\Controllers\Authcontroller;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/login/{provider}', [Authcontroller::class, 'socialLogin']);
Route::get('/googleLogin/callback', [Authcontroller::class, 'handleGoogleCallback']);
Route::get('/facebookLogin/callback', [Authcontroller::class, 'handleFacebookCallback']);
Route::get('/tiktokLogin/callback', [Authcontroller::class, 'handleTiktokCallback']);
Route::get('/appleLogin/callback', [Authcontroller::class, 'handleAppleCallback']);
Route::get('/afterResponse', function (Request $request) {
    dd(json_decode($request->data));
});

Route::prefix('admin')->group(function () {
    Route::get('{any}', function () {
        return view('adminApp');
    })->where('any', '.*');
});

Route::get('/{any}', function () {
    return view('userApp');
})->where('any', '.*');
