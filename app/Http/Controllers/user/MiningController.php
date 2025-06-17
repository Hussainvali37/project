<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\Rebate;
use App\Models\Task;
use App\Models\TaskRequest;
use App\Models\User;
use App\Models\Purchase;
use App\Models\UserLedger;
use Illuminate\Support\Facades\Auth;

class MiningController extends Controller
{
    public function received_amount()
    {
        $user = Auth::user();
        if ($user->receive_able_amount > 0){
            $uu = User::where('id', $user->id)->first();
            $uu->balance = $user->balance + $user->receive_able_amount;

            $ledger = new UserLedger();
            $ledger->user_id = $user->id;
            $ledger->reason = 'daily_income';
            $ledger->perticulation = 'Package commission Received.';
            $ledger->amount = $user->receive_able_amount;
            $ledger->credit = $user->receive_able_amount;
            $ledger->status = 'approved';
            $ledger->date = date("Y-m-d H:i:s");
            $ledger->save();

            $uu->receive_able_amount = 0;
            $uu->save();

            return response()->json(['status'=> true, 'message'=> 'Commission Received.'.price($uu->receive_able_amount), 'balance'=> price($uu->receive_able_amount)]);
        }else{
            return response()->json(['status'=> true, 'message'=> 'Waiting for commission added', 'balance'=> price($user->receive_able_amount)]);
        }
    }
    public function received_rebate()
    {
        $user = Auth::user();
        if ($user->rebate_balance > 0){
            $uu = User::where('id', $user->id)->first();
            $uu->balance = $user->balance + $user->rebate_balance;

            $ledger = new UserLedger();
            $ledger->user_id = $user->id;
            $ledger->reason = 'rebate';
            $ledger->perticulation = 'You have received registration rebate bonus';
            $ledger->amount = $user->rebate_balance;
            $ledger->credit = $user->rebate_balance;
            $ledger->status = 'approved';
            $ledger->date = date("Y-m-d H:i:s");
            $ledger->save();

            $uu->rebate_balance = 0;
            $uu->save();

            return back()->with('success', 'Rebate commission received success');
        }else{
            return back()->with('success', 'Rebate commission not received');
        }
    }

    public function apply_task_commission($task_id)
    {
        $user = Auth::user();
        $task = Task::where('id', $task_id)->first();
        if ($task){
            $taskReceived = TaskRequest::where('user_id', auth()->id())->where('task_id', $task_id)->first();
            if ($taskReceived){
                return redirect()->back()->with('success', 'You have received this award before.');
            }

            //First Level Users
            $first_level_users = User::where('ref_by', $user->ref_id)->get();

            $first_ids = $first_level_users->pluck('id'); //first
            $lv1Recharge = Deposit::whereIn('user_id', $first_ids)->where('status', 'approved')->sum('amount');

            $countDownUserPurchased = User::where('ref_by', auth()->user()->ref_id)->where('investor', 1)->count();

            if ($lv1Recharge >= $task->invest){
                $updateUser = User::where('id', $user->id)->first();

                $taskModel = new TaskRequest();
                $taskModel->user_id = $updateUser->id;
                $taskModel->task_id = $task_id;
                $taskModel->bonus = $task->bonus;
                $taskModel->team_size = $countDownUserPurchased;
                $taskModel->status = 'received';
                $taskModel->save();

                $ledger = new UserLedger();
                $ledger->user_id = $user->id;
                $ledger->reason = 'rebate';
                $ledger->perticulation = 'You have received target filup investor. team invest '.price($lv1Recharge). ' and your reward '. price($task->bonus);
                $ledger->amount = $task->bonus;
                $ledger->credit = $task->bonus;
                $ledger->status = 'approved';
                $ledger->date = date("Y-m-d H:i:s");
                $ledger->save();

                $updateUser->balance = $updateUser->balance + $task->bonus;
                $updateUser->save();
                return redirect()->back()->with('success', 'Congratulations. you have received the reward.');
            }else{
                return redirect()->back()->with('success', 'You will need more invest.');
            }
        }
    }
}








