<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    function getAllUsersExceptAuth()
    {
        $users = User::whereNot('id', Auth::id())->get();
        return response(get_defined_vars(), 200);
    }

    function getUser(Request $request)
    {
        if (isset($request->id)) {
            $user = User::find($request->id);
            if (isset($user)) {
                return response()->json(['user' => $user], 202);
            } else {
                return response()->json(['message' => "User with given id not found."], 404);
            }
        } else {
            return response()->json(['message' => "User id is not given."], 404);
        }
    }

    function getAuthUser(Request $request)
    {
        return response()->json(['user' => Auth::user()], 202);
    }

    public function updateUserDetail(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.Auth::user()->id,
        ]);
        $user = User::find(Auth::user()->id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();
        return response()->json([
            "message" => "Personal detail has been updated successfully.",
            "user" => $user,
        ], 200);
    }

    public function updateUserPassword(Request $request)
    {
        $request->validate([
            'password' => 'required|min:8|confirmed',
        ]);
        $user = User::find(Auth::user()->id);
        $user->password = $request->password;
        $user->save();
        return response()->json([
            "message" => "Password has been updated successfully.",
            "user" => $user,
        ], 200);
    }

    public function addUser(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|confirmed',
            'email_status' => 'required',
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->email_verified_at = ($request->email_status ? now()->format('Y-m-d H:i:s') : null);
        $user->type = $request->userType == 'user' ? 'user' : ($request->userType == 'admin' ? 'admin' : 'user');
        $user->save();
        return response()->json([
            "message" => "User has been added successfully.",
            "user" => $user,
        ], 200);
    }

    function deleteUser(Request $request)
    {
        if (isset($request->id)) {
            $user = User::find($request->id);
            if (isset($user)) {
                $user->delete();
                return response()->json(['message' => "User has been deleted successfully."], 202);
            } else {
                return response()->json(['message' => "User with given id not found."], 404);
            }
        } else {
            return response()->json(['message' => "User id is not given."], 404);
        }
    }
}
