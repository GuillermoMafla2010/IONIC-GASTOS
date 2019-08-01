<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login','UsuariosController@login');

Route::group(['middleware'=>['cors',/*'jwt.auth'*/]],function(){
    // Route::post('login','UsuariosController@login');
     Route::resource('users','UsuariosController');
     Route::resource('ingresos','IngresosController');
     Route::resource('gastos','GastosController');
     Route::resource('categoriasgastos','CategoriasGastosController');
     Route::resource('categoriasingresos','CategoriasIngresosController');
    Route::get('vergasto/{id}','GastosController@vergasto');
    Route::get('veringreso/{id}','IngresosController@veringreso');
});
