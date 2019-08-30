<?php

namespace App\Http\Controllers;

use App\Deudas;
use Illuminate\Http\Request;

class DeudasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Deudas::all();
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
        $deuda= new Deudas();
        $deuda->cantidad=$request->cantidad;
        $deuda->fecha=$request->fecha;
        $deuda->usuario_id=$request->usuario_id;
        $deuda->nombre_deuda=$request->nombre_deuda;
        
        $deuda->save();
        $data=[
            "mensaje"=>"Deuda creada",
            "status"=>200
        ];

        return response()->json($data);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Deudas  $deudas
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Deuda::where('usuario_id',$id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Deudas  $deudas
     * @return \Illuminate\Http\Response
     */
    public function edit(Deudas $deudas)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Deudas  $deudas
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Deudas $deudas)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Deudas  $deudas
     * @return \Illuminate\Http\Response
     */
    public function destroy(Deudas $deudas)
    {
        //
    }
}
