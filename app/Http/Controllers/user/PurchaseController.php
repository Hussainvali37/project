<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Fund;
use App\Models\FundInvest;
use App\Models\Package;
use App\Models\Purchase;
use App\Models\Rebate;
use App\Models\User;
use App\Models\UserLedger;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class PurchaseController extends Controller
{
    public function purchase_vip($id)
    {
        $package = Package::find($id);
        return view('app.main.vip_details', compact('package'));
    }
    public function purchaseConfirmation($id)
    {
        $package = Package::find($id);
        $user = Auth::user();
        $rebate = Rebate::first();

        session()->put('buy', true);

        //Check status
        if ($package->status != 'active')
        {
            return response()->json(['status'=> false, 'message'=> 'in-active plan']);
        }

        //check exists
        $eee = Purchase::where('user_id', $user->id)->where('package_id', $package->id)->where('status', 'active')->count();
        if($eee > 0){
            return response()->json(['status'=> false, 'message'=> 'This activates your account']);
        }

        if ($package){
            if ($package->price <= $user->balance){
                User::where('id', $user->id)->update([
                    'balance'=> $user->balance - $package->price,
                    'investor' => $package->price > 0 ? 1 : 0
                ]);

                //Purchase Table Create
                $purchase = new Purchase();
                $purchase->user_id = Auth::id();
                $purchase->package_id = $package->id;
                $purchase->amount = $package->price;
                $purchase->daily_income = $package->commission_with_avg_amount / $package->validity;
                $purchase->date = now()->addHours(24);
                $purchase->validity = now()->addDays($package->validity);
                $purchase->status = 'active';
                $purchase->save();

                $first_ref = User::where('ref_id', Auth::user()->ref_by)->first();
                if ($first_ref){
                    $amount = $package->price * $rebate->team_commission1 / 100;

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
                        $amount = $package->price * $rebate->team_commission2 / 100;
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
                            $amount = $package->price * $rebate->team_commission3 / 100;
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
                return response()->json(['status'=> true, 'message'=> 'Successfully completed']);
            }else{
                return response()->json(['status'=> false, 'message'=> 'insufficient balance']);
            }
        }else{
            return response()->json(['status'=> false, 'message'=> 'This is our default package']);
        }
    }


    public function vip_confirm($vip_id)
    {
        $vip = Package::find($vip_id);
        return view('app.main.vip_confirm', compact('vip'));
    }

    protected function ref_user($ref_by)
    {
        return User::where('ref_id', $ref_by)->first();
    }
}
