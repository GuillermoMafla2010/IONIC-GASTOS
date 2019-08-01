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
        return Usuarios::with(['ingresos','gastos'])->where('id',$id)->get();
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
