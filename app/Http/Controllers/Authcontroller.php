<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Laravel\Sanctum\Sanctum;
use Laravel\Socialite\Facades\Socialite;

class Authcontroller extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|confirmed',
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->type = $request->userType == 'user' ? 'user' : ($request->userType == 'admin' ? 'admin': 'user' );
        $user->save();
        $email = $request->email;
        $this->sendCodeToEmail($email);
        return response()->json([
            "message" => "Enter a code you received on your email",
            "user" => $user,
        ], 200);
    }

    function checkUnverifiedUser(Request $request)
    {
        $user = User::where('email', $request->email)->where('email_verified_at', null)->first();
        return response()->json(['status' => isset($user)], 200);
    }

    function sendVerificationCodeToEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);
        $user = User::where('email', $request->email)->first();
        if (isset($user)) {
            $this->sendCodeToEmail($request->email);
            return response()->json([
                "message" => "Enter a code you received on your email",
            ], 200);
        } else {
            return response()->json(['message' => "user not found."], 402);
        }
    }

    function codeVerification(Request $request)
    {
        $request->validate([
            'code' => 'required|integer'
        ], [
            'code.integer' => 'Code must be an integer'
        ]);
        $user = User::where('email', $request->email)->first();
        if ($user->code == $request->code) {
            $user->code = null;
            $user->email_verified_at = date('Y-m-d H:i:s');
            $user->save();
            Auth::login($user);
            $token = $user->createToken('user_token')->plainTextToken;
            return response()->json([
                'token' => $token,
                'user' => $user,
                'message' => 'Succeed.',
            ], 200);
        } else {
            return response()->json(['message' => 'Invalid verification code.'], 422);
        }
    }

    function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $user = User::where('email', $request->email)->first();
        if ($user && Hash::check($request->password, $user->password)) {
            if (isset($user->email_verified_at)) {
                Auth::login($user);
                $token = $user->createToken('user_token')->plainTextToken;
                return response()->json([
                    'token' => $token,
                    'user' => $user,
                    'message' => 'Succeed',
                    'status' => 'verified',
                ], 200);
            } else {
                $this->sendCodeToEmail($user->email);
                return response()->json([
                    "message" => "Enter a code you received on your email",
                    "status" => 'notVerified',
                    "user" => $user,
                ], 200);
            }
        } else {
            return response()->json(["message" => "Invalid username or password"], 422);
        }
    }

    public function checkToken(Request $request)
    {
        $user = Auth::user();
        if ($user) {
            return response()->json(['status' => 'authenticated'], 200);
        }
    }

    function invalidBarrerToken()
    {
        return response()->json(['status' => 'notAuthenticated'], 401);
    }

    function socialLogin(Request $request)
    {
        return Socialite::driver($request->provider)->redirect();
    }
    function handleGoogleCallback()
    {
        $googleUser = Socialite::driver('google')->user();
        // dd($googleUser);
        $user = User::where('google_user_id', $googleUser->id)->orWhere('email', $googleUser->email)->first();
        if (!isset($user)) {
            $user = new User();
        }
        $user->email = $googleUser->email;
        $user->type = 'user';
        $user->google_user_id = $googleUser->id;
        $user->name = $googleUser->name;
        $user->email_verified_at = date('Y-m-d H:i:s');
        $user->password = isset($user->password) ? $user->password : $googleUser->token;
        $user->save();
        $this->uploadSocialImage($googleUser->avatar, $user);
        Auth::login($user);
        $token = $user->createToken('user_token')->plainTextToken;
        return redirect('/admin/afterSocialCallBack?data=' . json_encode([
            'message' => 'Logged in Successfully',
            'token' => $token,
            'user' => $user,
        ]));
    }
    public function handleFacebookCallback()
    {
        $facebookUser = Socialite::driver('facebook')->user();
        $user = User::where('facebook_user_id', $facebookUser->id)->orWhere('email', $facebookUser->email)->first();
        if (!isset($user)) {
            $user = new User();
        }
        $user->type = 'user';
        $user->email = $facebookUser->email;
        $user->facebook_user_id = $facebookUser->id;
        $user->name = $facebookUser->name;
        $user->email_verified_at = date('Y-m-d H:i:s');
        $user->password = isset($user->password) ? $user->password : $facebookUser->token;
        $this->uploadSocialImage($facebookUser->avatar, $user);
        $user->save();
        Auth::login($user);
        $token = $user->createToken('user_token')->plainTextToken;
        return redirect('/admin/afterSocialCallBack?data=' . json_encode([
            'message' => 'Logged in Successfully',
            'token' => $token,
            'user' => $user,
        ]));
    }
    public function handleTiktokCallback()
    {
        $tiktokUser = Socialite::driver('tiktok')->user();
        dd($tiktokUser);
        $user = new User();
        $user->tiktok_user_id = $tiktokUser->id;
        $user->name = $tiktokUser->name;
        $user->image = $tiktokUser->avatar;
        $user->password = isset($user->password) ? $user->password : $tiktokUser->token;
        $user->save();

        // Auth::login($user);
        // $token = Auth::user()->createToken('bearerToken')->plainTextToken;
        return redirect('/afterResponse?data=' . json_encode($user));
    }
    public function handleAppleCallback()
    {
        $appleUser = Socialite::driver('apple')->user();
        dd($appleUser);
        $user = User::where('apple_user_id', $appleUser->id)->orWhere('email', $appleUser->email)->first();
        if (!isset($user)) {
            $user = new User();
        }
        $user->email = $appleUser->email;
        $user->apple_user_id = $appleUser->id;
        $user->name = $appleUser->name;
        $user->image = isset($appleUser->avatar) ? $appleUser->avatar : '';
        $user->password = isset($user->password) ? $user->password : $appleUser->token;
        $user->save();

        // Auth::login($user);
        // $token = Auth::user()->createToken('bearerToken')->plainTextToken;
        return redirect('/afterResponse?data=' . json_encode($user));
    }
}
