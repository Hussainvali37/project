<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class SettingController extends Controller
{
    public $route = 'admin.setting';
    public function index()
    {
        $data = Setting::find(1);
        return view('admin.pages.setting.index', compact('data'));
    }

    public function insert_or_update(Request $request)
    {
        $validate = Validator::make($request->all(), [
           'withdraw_charge' => 'required',
           'maximum_withdraw' => 'required',
           'minimum_withdraw' => 'required',
           'checkin' => 'required',
           'w_time_status' => 'required',
           'registration_bonus' => 'required',
           'total_member_register_reword' => 'required',
           'total_member_register_reword_amount' => 'required',
        ]);

        if ($validate->fails()){
            return redirect()->route($this->route.'.index')->withErrors($validate->errors());
        }

        $model = Setting::findOrFail(1);
        $model->withdraw_charge = $request->withdraw_charge;
        $model->minimum_withdraw = $request->minimum_withdraw;
        $model->maximum_withdraw = $request->maximum_withdraw;
        $model->w_time_status = $request->w_time_status;
        $model->checkin = $request->checkin;
        $model->registration_bonus = $request->registration_bonus;
        $model->total_member_register_reword_amount = $request->total_member_register_reword_amount;
        $model->total_member_register_reword = $request->total_member_register_reword;
        $model->service = $request->service;

        $model->update();
        return redirect()->route($this->route.'.index')->with('success', 'Settings Updated Successfully.');
    }
}
