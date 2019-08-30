<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cgastos extends Model
{
    //

    public $timestamps = false;
    public function cuentas(){
        return $this->belongsTo(Cuentas::class);
    }
}
