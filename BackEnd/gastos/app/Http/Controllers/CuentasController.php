<?php

namespace App\Http\Controllers;

use App\Cuentas;
use Illuminate\Http\Request;

class CuentasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $ingreso=[];
        $data=Cuentas::with(['usuarios','bancos','cgastos','cingresos'])->get();

        $mensaje=[
            "datos"=>$data
        ];

        return response()->json($mensaje);




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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Cuentas  $cuentas
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $ingresos=[];
        $gastos=[];
        $totalingresos=0.0;
        $totalgastos=0.0;
        $total=0.0;

        $data =Cuentas::where('id',$id)->with(['cingresos','cgastos','bancos'])->get();

        foreach($data as $dat){
            $ingresos=$dat->cingresos;
            $gastos=$dat->cgastos;

        }



        for($i=0;$i<count($ingresos);$i++){
            $totalingresos=$totalingresos+$ingresos[$i]->cantidad;
        }


        for($i=0;$i<count($gastos);$i++){
            $totalgastos=$totalgastos+$gastos[$i]->cantidad;
        }

        $response=[

            "cuenta"=>$data,
            "total"=>($totalingresos-$totalgastos)

        ];


        return response()->json($response);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Cuentas  $cuentas
     * @return \Illuminate\Http\Response
     */
    public function edit(Cuentas $cuentas)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Cuentas  $cuentas
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $cuentas=new Cuentas();
        $cuentas->numero_cuenta=$request->numero_cuenta;
        $cuentas->user_id=$request->user_id;

        Cuentas::where('id',$id)->update($cuentas->toArray());

        $data=[
            "mensaje"=>"Actualizado",
            "usuario"=>$cuentas
        ];

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Cuentas  $cuentas
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cuentas $cuentas)
    {
        //
    }
}
