<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Mail\RegistrationMail;
use App\Models\Admin;
use App\Models\BonusLedger;
use App\Models\Checkin;
use App\Models\Package;
use App\Models\Purchase;
use App\Models\User;
use App\Models\UserLedger;
use App\Providers\RouteServiceProvider;
use Carbon\Carbon;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use function GuzzleHttp\Promise\all;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(Request $request)
    {
        $vari_const_sources = [
            's1'=> [
                'code'=> '8955',
                'img'=> asset('public/code/1.png')
            ],
            's2'=> [
                'code'=> '7183',
                'img'=> asset('public/code/2.png')
            ],
            's3'=> [
                'code'=> '4060',
                'img'=> asset('public/code/3.png')
            ],
            's4'=> [
                'code'=> '5726',
                'img'=> asset('public/code/4.png')
            ],
            's5'=> [
                'code'=> '0009',
                'img'=> asset('public/code/5.png')
            ],
            's6'=> [
                'code'=> '5408',
                'img'=> asset('public/code/6.png')
            ],
            's7'=> [
                'code'=> '5076',
                'img'=> asset('public/code/7.png')
            ],
            's8'=> [
                'code'=> '0133',
                'img'=> asset('public/code/8.png')
            ],
            's9'=> [
                'code'=> '4153',
                'img'=> asset('public/code/9.png')
            ],
            's10'=> [
                'code'=> '7329',
                'img'=> asset('public/code/10.png')
            ],
            's11'=> [
                'code'=> '0738',
                'img'=> asset('public/code/11.png')
            ],
            's12'=> [
                'code'=> '6163',
                'img'=> asset('public/code/12.png')
            ],
            's13'=> [
                'code'=> '6444',
                'img'=> asset('public/code/13.png')
            ],
            's14'=> [
                'code'=> '9436',
                'img'=> asset('public/code/14.png')
            ]
        ];
        $index = rand(1, count($vari_const_sources));
        $code = $vari_const_sources['s'.(string)$index];

        $ref_by = $request->query('code');
        return view('app.auth.registration', compact('ref_by', 'code'));
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'phone' => ['required', 'numeric', 'unique:users,phone'],
            'password' => ['required'],
            ]);
        if ($validate->fails()){
            $user = User::where('phone', $request->phone)->first();
            if ($user){
                return response()->json(['status'=> false ,'message'=> 'phone number and password not exists']);
            }
            return response()->json(['status'=> false ,'message'=> 'something went wring']);
        }

        $getIp = \Request::ip();

        $checkUserIp = DB::table('users')->where('ip', $getIp)->count();
//        if ($checkUserIp > 3){
//            return response()->json(['status'=> false ,'message'=> 'Sign out of an account on your device']);
//        }

        if ($request->ref_by){
            $getUser = User::where('ref_id', $request->ref_by)->first();
            if ($getUser){
                $first_level_users = User::where('ref_by', $getUser->ref_id)->count();
                if ($first_level_users <= setting('total_member_register_reword')){
                    $getUser->balance = $getUser->balance + setting('total_member_register_reword_amount');
                    $getUser->save();

                    if (setting('total_member_register_reword_amount') > 0)
                    {
                        $ledger = new UserLedger();
                        $ledger->user_id = $getUser->id;
                        $ledger->reason = 'member invite reward';
                        $ledger->perticulation = 'Member account create reward';
                        $ledger->amount = setting('total_member_register_reword_amount');
                        $ledger->debit = setting('total_member_register_reword_amount');
                        $ledger->status = 'approved';
                        $ledger->date = now();
                        $ledger->save();
                    }

                }
            }
        }

        //Check refer code is next time edit
        $user = User::create([
            'name' => 'User'.rand(22,99),
            'username' => 'uname'.$request->phone,
            'ref_id' => $this->ref_code(),
            'ref_by' => $request->ref_by ?? $this->ref_code(),
            'email' => $request->phone.'@gmail.com',
            'password' => Hash::make($request->password),
            'type' => 'user',
            'phone' => $request->phone,
            'balance' => setting('registration_bonus'),
            'ip' => $getIp,
            'remember_token' => Str::random(30),
        ]);

        if ($user){

            $checkin = new Checkin();
            $checkin->user_id = $user->id;
            $checkin->date = now();
            $checkin->amount = 0;
            $checkin->save();

            if (setting('registration_bonus') > 0){
                $ledger = new UserLedger();
                $ledger->user_id = $user->id;
                $ledger->reason = 'Account create reward';
                $ledger->perticulation = 'Register reward';
                $ledger->amount = setting('registration_bonus');
                $ledger->debit = setting('registration_bonus');
                $ledger->status = 'approved';
                $ledger->date = now();
                $ledger->save();
            }

            Auth::login($user);

            return response()->json(['status'=> true ,'message'=> 'create processing', 'url'=> route('dashboard')]);
        }else{
            return response()->json(['status'=> false ,'message'=> 'Account create failed']);
        }

    }

    public function ref_code()
    {
        $str1 = strtolower(Str::random(2));
        $rand = rand(000,998);

        if (rand(111,999) % 2 == 0){
            $refCode = $str1.$rand;
        }else{
            $refCode = $rand.$str1;
        }
        return $refCode;
    }

    public function refreshCaptcha()
    {
        return response()->json(['captcha'=> captcha_img()]);
    }
}

