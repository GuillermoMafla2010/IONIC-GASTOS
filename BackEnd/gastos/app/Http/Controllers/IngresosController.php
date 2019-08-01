<?php

namespace App\Http\Controllers;

use App\Ingresos;
use Illuminate\Http\Request;

class IngresosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Ingresos::with(['usuarios','categorias'])->get();
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

        $ingreso=new Ingresos();

        $ingreso->nombre_ingreso=$request->nombre_ingreso;
        $ingreso->cantidad_ingreso=$request->cantidad_ingreso;
        $ingreso->user_id=$request->user_id;
        $ingreso->categoria_id=$request->categoria_id;
        $ingreso->fecha=$request->fecha;

        $ingreso->save();
        $data=[
            "message"=>"success",
            "status"=>200
        ];

        return response()->json($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Ingresos  $ingresos
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Ingresos::where('user_id',$id)->with(['usuarios','categorias'])->orderBy('id','desc')->get();
    }

    public function veringreso($id)
    {
        //
        return Ingresos::where('id',$id)->with(['usuarios','categorias'])->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Ingresos  $ingresos
     * @return \Illuminate\Http\Response
     */
    public function edit(Ingresos $ingresos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Ingresos  $ingresos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $ingreso=new Ingresos();
        $ingreso->nombre_ingreso=$request->nombre_ingreso;
        $ingreso->cantidad_ingreso=$request->cantidad_ingreso;
        $ingreso->user_id=$request->user_id;
        $ingreso->categoria_id=$request->categoria_id;
        $ingreso->fecha=$request->fecha;

        Ingresos::where('id',$id)->update($ingreso->toArray());

        $data=[
            "mensaje"=>"success",
            "status"=>200
        ];

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Ingresos  $ingresos
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //

         Ingresos::where('id',$id)->delete();
            return response()->json("Se ha borrado el ingreso");
    }
}
