<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\Deposit;
use App\Models\User;
use App\Models\UserLedger;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(Request $request)
    {
        if (Auth::check()){
            return redirect()->route('dashboard');
        }
        return view('app.auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(Request $request){
       $user = User::where('phone', $request->phone)->first();

        if (Auth::check()){
            return redirect()->route('dashboard');
        }


       if (!$user){
           return response()->json(['status'=> false ,'message'=> 'Account does not exist']);
        }

        //Check user ban or unban
        if ($user->ban_unban == 'ban')
        {
            return response()->json(['status'=> false ,'message'=> 'Your account has been banned']);
        }

        if ($user){
            if (Hash::check($request->password, $user->password)){
                Auth::login($user);
                return response()->json(['status'=> true ,'message'=> 'successfully', 'url'=> route('dashboard')]);
            }else{
                return response()->json(['status'=> false ,'message'=> 'The password you entered did not match']);
            }
        }else{
            return response()->json(['status'=> false ,'message'=> 'account not exists']);
        }
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect()->back()->with('success', 'logout successfully');
        return response()->json(['status'=> true ,'message'=> 'successfully', 'url'=> url('login')]);
    }
}
