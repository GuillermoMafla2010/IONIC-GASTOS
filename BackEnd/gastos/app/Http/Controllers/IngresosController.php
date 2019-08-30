<?php

namespace App\Http\Controllers;

use App\Ingresos;
use Illuminate\Http\Request;

class IngresosController extends Controller
{

    public function verfechas($id,$fecha_inicio,$fecha_fin,$categoria){

$data=[];
$suma=0.0;

            $dato=Ingresos::with(['usuarios','categorias'])->where("user_id",$id)->whereBetween('fecha',[$fecha_inicio,$fecha_fin])->get();
            foreach($dato as $item){

                if($categoria==0){
                    array_push($data,$item);
                }
                else if( $item->categorias->id==$categoria){
                    array_push($data,$item);
                }

            }
            for($i=0;$i<count($data);$i++){
                $suma=$suma+$data[$i]->cantidad_ingreso;
            }

            $data_json=[
                "data"=>$data,
                "suma"=>$suma
            ];


            return response()->json($data_json);


    }
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
        $gastos=[];
        $suma=0.0;

        $gasto= Ingresos::where('user_id',$id)->with(['usuarios','categorias'])->orderBy('id','desc')->get();

        for($i=0;$i<count($gasto);$i++){
            array_push($gastos,$gasto[$i]->cantidad_ingreso);

    }

    for($i=0;$i<count($gastos);$i++){
        $suma=$suma+$gastos[$i];
    }

    $data=[
        "ingresos"=>$gasto,
        "suma"=>$suma

    ];

    return response()->json($data);


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
         //$data= Ingresos::where('user_id',$id2)->with(['usuarios','categorias'])->orderBy('id','desc')->get();
            return response()->json("Ingreso Eliminado");
    }

}
