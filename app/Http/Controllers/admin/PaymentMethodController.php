<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PaymentMethodController extends Controller
{
    public $route = 'admin.method';
    public function index()
    {
        $methods = PaymentMethod::get();
        return view('admin.pages.method.index', compact('methods'));
    }
    public function create($id=null)
    {
        $data = null;
        if ($id){
            $data = PaymentMethod::find($id);
        }
        return view('admin.pages.method.insert', compact('data'));
    }

    public function insert_or_update(Request $request)
    {
        $this->validate($request,[
            'type'=> 'required',
            'address'=> 'required',
        ]);

        if ($request->id){
            $model = PaymentMethod::findOrFail($request->id);
            $model->status = $request->status;
        }else{
            $model = new PaymentMethod();
        }

        $model->type = $request->type;
        $model->channel = $request->channel;
        $model->address = $request->address;
        $model->receiver = $request->receiver;
        $model->minimum = $request->minimum;
        $model->maximum = $request->maximum;

        $model->save();
        return redirect()->route($this->route.'.index')->with('success', $request->id ? 'Payment method Updated Successful.' : 'Package Created Successful.');
    }

    public function delete($id)
    {
        $model = PaymentMethod::find($id);
        $model->delete();
        return redirect()->route($this->route.'.index')->with('success','Item Deleted Successful.');
    }
}
