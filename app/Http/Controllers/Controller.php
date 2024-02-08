<?php

namespace App\Http\Controllers;

use App\Jobs\SendVerificationCodeEmailJob;
use App\Models\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Storage;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;
    function sendCodeToEmail($email)
    {
        $code = mt_rand(100000, 999999);
        $user = User::where('email', $email)->first();
        $user->code = $code;
        $user->save();
        dispatch(new SendVerificationCodeEmailJob($code, $user));
    }
    function uploadSocialImage($imageUrl, $user)
    {
        if (isset($user->image) && file_exists(public_path($user->image))) {
            unlink(public_path($user->image));
        }
        // Get the contents of the image from the URL
        $imageContent = file_get_contents($imageUrl);

        // Generate a unique filename for the stored image
        $filename = 'user_'.$user->id.'_profile_' . uniqid() . '.jpg';

        // Define the path to the public folder
        $publicPath = public_path('profile_images/' . $filename);

        // Store the image in the public/profile_images directory
        file_put_contents($publicPath, $imageContent);

        // Return the URL of the stored image
        $user->image = 'profile_images/' . $filename;
        $user->save();
    }

    // Function to delete an image from the server
    function deleteImage($imageName)
    {
        Storage::disk('public')->delete('profile_images/' . $imageName);
    }
}
