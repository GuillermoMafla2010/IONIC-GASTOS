<?php

namespace App\Http\Controllers;

use App\Gastos;
use Illuminate\Http\Request;

class GastosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $gastos=[];
        $suma=0.0;


        $gasto=Gastos::with(['usuarios','categorias'])->get();
        for($i=0;$i<count($gasto);$i++){
                array_push($gastos,$gasto[$i]->cantidad_gasto);

        }

        for($i=0;$i<count($gastos);$i++){
            $suma=$suma+$gastos[$i];
        }

        $data=[
            "gastos"=>$gasto,
            "suma"=>$suma

        ];

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
        $gastos=new Gastos();

        $gastos->nombre_gasto=$request->nombre_gasto;
        $gastos->cantidad_gasto=$request->cantidad_gasto;
        $gastos->user_id=$request->user_id;
        $gastos->categoria_id=$request->categoria_id;
        $gastos->fecha=$request->fecha;

        $gastos->save();
        $data=[
            "message"=>"success",
            "status"=>200
        ];

        return response()->json($data);



    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Gastos  $gastos
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $gastos=[];
        $suma=0.0;

        $gasto= Gastos::where('user_id',$id)->with(['usuarios','categorias'])->orderBy('id','desc')->get();

        for($i=0;$i<count($gasto);$i++){
            array_push($gastos,$gasto[$i]->cantidad_gasto);

    }

    for($i=0;$i<count($gastos);$i++){
        $suma=$suma+$gastos[$i];
    }

    $data=[
        "gastos"=>$gasto,
        "suma"=>$suma

    ];

    return response()->json($data);
    }

    public function vergasto($id)
    {
        //
        return Gastos::where('id',$id)->with(['usuarios','categorias'])->get();

    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Gastos  $gastos
     * @return \Illuminate\Http\Response
     */
    public function edit(Gastos $gastos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Gastos  $gastos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $gasto=new Gastos();
        $gasto->nombre_gasto=$request->nombre_gasto;
        $gasto->cantidad_gasto=$request->cantidad_gasto;
        $gasto->user_id=$request->user_id;
        $gasto->categoria_id=$request->categoria_id;
        $gasto->fecha=$request->fecha;

        Gastos::where('id',$id)->update($gasto->toArray());

        $data=[
            "mensaje"=>"success",
            "status"=>200
        ];

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Gastos  $gastos
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
         Gastos::where('id',$id)->delete();
         return response()->json("Se ha borrado el gasto");
    }


    public function verfechas($id,$fecha_inicio,$fecha_fin,$categoria){
        $data=[];
$suma=0.0;

            $dato=Gastos::with(['usuarios','categorias'])->where("user_id",$id)->whereBetween('fecha',[$fecha_inicio,$fecha_fin])->get();
            foreach($dato as $item){

                if($categoria==0){
                    array_push($data,$item);
                }
                else if($item->categoria_id==$categoria){
                    array_push($data,$item);
                }

            }
            for($i=0;$i<count($data);$i++){
                $suma=$suma+$data[$i]->cantidad_gasto;
            }

            $data_json=[
                "data"=>$data,
                "suma"=>$suma
            ];


            return response()->json($data_json);




    }
}
