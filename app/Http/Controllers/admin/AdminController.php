<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\FundInvest;
use App\Models\Package;
use App\Models\Purchase;
use App\Models\Rebate;
use App\Models\User;
use App\Models\UserLedger;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function login()
    {
        if (Auth::guard('admin')->check()) {
            return redirect()->route('admin.dashboard');
        }
        return view('admin.auth.login');
    }


    public function commission()
    {
        $purchases = Purchase::where('status', 'active')->where('date', '<=', now())->get();
        foreach ($purchases as $purchase) {
            $user = User::where('id', $purchase->user_id)->first();
            if ($user) {
                $package = Package::where('id', $purchase->package_id)->first();
                if ($package) {
                    if (now()->greaterThanOrEqualTo($purchase->date)) {
                        $dailyIncome = $package->commission_with_avg_amount / $package->validity;

                        $amount = $user->balance + $dailyIncome;
                        $user->balance = $amount;
                        $user->save();

                        $purchase->date = now()->addHours(24);
                        $purchase->save();

                        $ledger = new UserLedger();
                        $ledger->user_id = $user->id;
                        $ledger->reason = 'daily_income';
                        $ledger->perticulation = $package->name . ' Package commission';
                        $ledger->amount = $dailyIncome;
                        $ledger->credit = $dailyIncome;
                        $ledger->status = 'approved';
                        $ledger->date = date("Y-m-d H:i:s");
                        $ledger->save();

                        $checkExpire = new Carbon($purchase->validity);
                        if ($checkExpire->isPast()) {
                            $ppp = Purchase::where('id', $purchase->id)->first();
                            $ppp->status = 'inactive';
                            $ppp->save();
                        }

                        $rebate = Rebate::first();
                        $first_ref = User::where('ref_id', $user->ref_by)->first();
                        if ($first_ref){
                            $amount = $dailyIncome * $rebate->interest_commission1 / 100;

                            User::where('id', $first_ref->id)->update([
                                'balance' => $first_ref->balance + $amount
                            ]);

                            $ledger = new UserLedger();
                            $ledger->user_id = $first_ref->id;
                            $ledger->get_balance_from_user_id = $user->id;
                            $ledger->reason = 'commission';
                            $ledger->perticulation = 'level 1 product buy commission';
                            $ledger->amount = $amount;
                            $ledger->debit = $amount;
                            $ledger->status = 'approved';
                            $ledger->step = 'first';
                            $ledger->date = date('d-m-Y H:i');
                            $ledger->save();

                            $second_ref = User::where('ref_id', $first_ref->ref_by)->first();
                            if ($second_ref){
                                $amount = $dailyIncome * $rebate->interest_commission2 / 100;
                                User::where('id', $second_ref->id)->update([
                                    'balance' => $second_ref->balance + $amount
                                ]);

                                $ledger = new UserLedger();
                                $ledger->user_id = $second_ref->id;
                                $ledger->get_balance_from_user_id = $user->id;
                                $ledger->reason = 'commission';
                                $ledger->perticulation = 'level 2 product buy commission';
                                $ledger->amount = $amount;
                                $ledger->debit = $amount;
                                $ledger->status = 'approved';
                                $ledger->step = 'second';
                                $ledger->date = date('d-m-Y H:i');
                                $ledger->save();

                                $third_ref = User::where('ref_id', $second_ref->ref_by)->first();
                                if ($third_ref){
                                    $amount = $dailyIncome * $rebate->interest_commission3 / 100;
                                    User::where('id', $third_ref->id)->update([
                                        'balance' => $third_ref->balance + $amount
                                    ]);

                                    $ledger = new UserLedger();
                                    $ledger->user_id = $third_ref->id;
                                    $ledger->get_balance_from_user_id = $user->id;
                                    $ledger->reason = 'commission';
                                    $ledger->perticulation = 'level 3 product buy commission';
                                    $ledger->amount = $amount;
                                    $ledger->debit = $amount;
                                    $ledger->status = 'approved';
                                    $ledger->step = 'third';
                                    $ledger->date = date('d-m-Y H:i');
                                    $ledger->save();
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    public function login_submit(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if (Auth::guard('admin')->attempt($credentials)) {
            $admin = Auth::guard('admin')->user();
            if ($admin->type == 'admin') {
                return redirect()->route('admin.dashboard')->with('success', 'Logged In Successful.');
            } else {
                return error_redirect('admin.login', 'error', 'Admin Credentials Very Secured Please Don"t try Again.');
            }
        } else {
            return error_redirect('admin.login', 'error', 'Admin Credentials Does Not Match.');
        }
    }

    public function logout()
    {
        if (Auth::guard('admin')->check()) {
            Auth::guard('admin')->logout();
            return redirect()->route('admin.login')->with('success', 'Logged out successful.');
        } else {
            return error_redirect('admin.login', 'error', 'You are already logged out.');
        }
    }

    public function dashboard()
    {
        return view('admin.dashboard');
    }

    public function developer()
    {
        return view('admin.developer');
    }

    public function profile()
    {
        return view('admin.profile.index');
    }

    public function profile_update()
    {
        $admin = Admin::first();
        return view('admin.profile.update-details', compact('admin'));
    }

    public function profile_update_submit(Request $request)
    {
        $admin = Admin::find(1);
        $path = uploadImage(false, $request, 'photo', 'admin/assets/images/profile/', $admin->photo);
        $admin->photo = $path ?? $admin->photo;
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->phone = $request->phone;
        $admin->address = $request->address;
        $admin->update();
        return redirect()->route('admin.profile.update')->with('success', 'Admin profile updated.');
    }

    public function change_password()
    {
        $admin = admin()->user();
        return view('admin.profile.change-password', compact('admin'));
    }

    public function check_password(Request $request)
    {
        $admin = admin()->user();
        $password = $request->password;
        if (Hash::check($password, $admin->password)) {
            return response()->json(['message' => 'Password matched.', 'status' => true]);
        } else {
            return response()->json(['message' => 'Password dose not match.', 'status' => false]);
        }
    }

    public function change_password_submit(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required'
        ]);
        if ($validate->fails()) {
            session()->put('errors', true);
            return redirect()->route('admin.changepassword')->withErrors($validate->errors());
        }

        $admin = admin()->user();
        $password = $request->old_password;
        if (Hash::check($password, $admin->password)) {
            if (strlen($request->new_password) > 5 && strlen($request->confirm_password) > 5) {
                if ($request->new_password === $request->confirm_password) {
                    $admin->password = Hash::make($request->new_password);
                    $admin->update();
                    return redirect()->route('admin.changepassword')->with('success', 'Password changed successfully');
                } else {
                    return error_redirect('admin.changepassword', 'error', 'New password and confirm password dose not match');
                }
            } else {
                return error_redirect('admin.changepassword', 'error', 'Password must be greater then 6 or equal.');
            }
        } else {
            return error_redirect('admin.changepassword', 'error', 'Password dose not match');
        }
    }
}
