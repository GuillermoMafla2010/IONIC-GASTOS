<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deudas extends Model


{
    public $timestamps = false;
    //
    public function usuario(){
        return $this->belongsTo(Usuario::class);
    }
}
