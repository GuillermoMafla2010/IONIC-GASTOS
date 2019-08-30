<?php

namespace App\Http\Controllers;

use App\Usuarios;
use App\User;
use Illuminate\Http\Request;
use JWTAuth;
use JWTAuthException;
use Tymon\JWTAuth\Contracts\JWTSubject;

class UsuariosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return User::with(['ingresos','gastos'])->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }


    public function login(Request $request){
        $usuario=User::where('email',$request->email)->get()->first();//->load('roles')->first();


       if($usuario && \Hash::check($request->password,$usuario->password) ){
          // $token=self::getToken($request->email, $request->password);

           $payloadable = [
               'id' => $usuario->id,
               'nombre' => $usuario->nombre,
               //'roles' => $usuario->roles,

           ];

          $token= JWTAuth::customClaims($payloadable)->attempt(['email' =>$request->email , 'password' => $request->password]);


           $respuesta=['token'=>$token,'success'=>true,'data'=>'Bienvenido'];
           return response()->json($respuesta,201);

       }else{

           $respuesta=['success'=>false,'data'=>'Usuario o contraseña no encontrados'];
           return response()->json($respuesta,400);
       }

   }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //

         //Instancio la clase Usuario
         $usuario=new Usuarios();
         //$roles=new UsuariosRoles();
         //$sedes=new Sedes();
         //Declaro el nombre enviado desde frontend
         $usuario->nombre=$request->nombre;
         $usuario->email=$request->email;
         $usuario->password=\Hash::make($request->password);
         $usuario->celular=$request->celular;
         $usuario->foto=$request->foto;
         $usuario->save();






         $data=array('status'=>'success','code'=>200,'mensaje'=>'Usuario Creado correctamente');

         return response()->json($data,200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Usuarios  $usuarios
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $ingresos1=[];
        $ingresos2=[];
        $sumaingresos=0.0;
        $gastos1=[];
        $gastos2=[];
        $sumagastos=0.0;
        $usuario= Usuarios::with(['ingresos','gastos'])->where('id',$id)->get();

        foreach($usuario as $item){
           //
           $ingresos1=$item->ingresos;
            //
        }

        foreach($usuario as $item){
            $gastos1=$item->gastos;
        }

        for($i=0;$i<count($ingresos1);$i++){
            array_push($ingresos2,$ingresos1[$i]->cantidad_ingreso);
            $sumaingresos=$sumaingresos+$ingresos2[$i];

        }

        for($i=0;$i<count($gastos1);$i++){
            array_push($gastos2,$gastos1[$i]->cantidad_gasto);
            $sumagastos=$sumagastos+$gastos2[$i];

        }

        $data=[
            "usuario"=>$usuario,
            "totalingreso"=>$sumaingresos,
            "totalgasto"=>$sumagastos
        ];

        return response()->json($data);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Usuarios  $usuarios
     * @return \Illuminate\Http\Response
     */
    public function edit(Usuarios $usuarios)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuarios  $usuarios
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usuarios $usuarios)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Usuarios  $usuarios
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuarios $usuarios)
    {
        //
    }
}
