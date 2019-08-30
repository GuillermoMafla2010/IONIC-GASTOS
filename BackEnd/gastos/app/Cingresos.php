<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cingresos extends Model
{
    //
    public $timestamps = false;

    public function cuentas(){
        return $this->belongsTo(Cuentas::class);
    }
}
