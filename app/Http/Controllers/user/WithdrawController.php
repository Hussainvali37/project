<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\PaymentMethod;
use App\Models\User;
use App\Models\UserLedger;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Deposit;
use App\Models\Purchase;
use Carbon\Carbon;
use Illuminate\Support\Str;

class WithdrawController extends Controller
{
    public function withdraw()
    {
        if(user()->gateway_method == null || user()->gateway_number == null){
            return redirect()->route('user.bank.create');
        }
        return view('app.main.withdraw.index');
    }

    public function withdraw_history()
    {
        return view('app.main.withdraw_history');
    }

    public function withdrawRequest(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'amount' => 'required|numeric',
        ]);

        if(setting('w_time_status') == 'inactive'){
            return redirect()->back()->with('error', '10 am to 5 pm');
        }

        if ($request->amount == null){
            return redirect()->back()->with('error', 'Withdraw required amount');
        }

        $user = Auth::user();

//        if (Deposit::where('user_id', $user->id)->where('status', 'approved')->count() < 1){
//            return redirect()->back()->with('error', 'You need to recharge before withdrawal');
//        }

        if ($validate->fails()) {
            return redirect()->back()->withErrors('errors', $validate->errors());
        }

        if ($request->amount <= $user->balance) {
            if ($request->amount >= setting('minimum_withdraw')) {
                if ($request->amount <= setting('maximum_withdraw')) {
                    $charge = 0;
                    if (setting('withdraw_charge') > 0) {
                        $charge = ($request->amount * setting('withdraw_charge')) / 100;
                    }


                    //Update User Balance
                    $balance = $user->balance - $request->amount;
                    User::where('id', $user->id)->update([
                        'balance' => $balance,
                    ]);

                    //Withdraw
                    $withdrawal = new Withdrawal();
                    $withdrawal->user_id = $user->id;
                    $withdrawal->method_name = $user->gateway_method;
                    $withdrawal->number = $user->gateway_number;
                    $withdrawal->amount = $request->amount;
                    $withdrawal->charge = $charge;
                    $withdrawal->oid = rand(000000, 999999) . strtolower(Str::random(5)) . rand(000000, 999999);
                    $withdrawal->final_amount = $request->amount - $charge;
                    $withdrawal->status = 'pending';
                    $withdrawal->save();
                    return redirect()->back()->with('success', "Withdrawal sent successfully");
                } else {
                    return redirect()->back()->with('error', 'Enter the maximum amount: ' . price(setting('maximum_withdraw')));
                }
            } else {
                return redirect()->back()->with('error', 'Enter the minimum amount ' . price(setting('minimum_withdraw')));
            }
        } else {
            return redirect()->back()->with('error', 'Insufficient account balance');
        }
    }
}
