<?php

namespace App\Http\Controllers;

use App\Cgastos;
use Illuminate\Http\Request;

class CgastosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $bancos=[];
        $data = Cgastos::with(['cuentas'])->get();

        return response()->json($data);

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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $gasto=new Cgastos();
        $gasto->nombre_gasto=$request->nombre_gasto;
        $gasto->cantidad=$request->cantidad;
        $gasto->fecha=$request->fecha;
        $gasto->cuentas_id=$request->cuentas_id;

        $gasto->save();
        $data=[
            "mensaje"=>"gasto ingresado correctamente",
            "status"=>200
        ];

        return response()->json($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Cgastos  $cgastos
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Cgastos::where('cuentas_id',$id)->orderBy('id','desc')->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Cgastos  $cgastos
     * @return \Illuminate\Http\Response
     */
    public function edit(Cgastos $cgastos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Cgastos  $cgastos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cgastos $cgastos)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Cgastos  $cgastos
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        Cgastos::where('id',$id)->delete();
    }
}
