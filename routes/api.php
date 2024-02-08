<?php

use App\Http\Controllers\Authcontroller;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post('register', [Authcontroller::class, 'register']);
Route::post('check-unverified-user', [Authcontroller::class, 'checkUnverifiedUser']);
Route::post('send-verification-code-to-email', [Authcontroller::class, 'sendVerificationCodeToEmail']);
Route::post('verify-code', [Authcontroller::class, 'codeVerification']);
Route::post('login', [Authcontroller::class, 'login']);

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::get('get-all-users-except-auth', [UserController::class, 'getAllUsersExceptAuth']);
    Route::get('get-user', [UserController::class, 'getUser']);
    Route::post('get-auth-user', [UserController::class, 'getAuthUser']);
    Route::post('add-user', [UserController::class, 'addUser']);
    Route::post('update-user-detail', [UserController::class, 'updateUserDetail']);
    Route::post('change-password', [UserController::class, 'updateUserPassword']);
    Route::post('delete-user', [UserController::class, 'deleteUser']);
    Route::post('check-token', [Authcontroller::class, 'checkToken']);
    Route::post('logout', [Authcontroller::class, 'logout']);
});

Route::get('invalid-barrer-token', [Authcontroller::class, 'invalidBarrerToken'])->name('login');
