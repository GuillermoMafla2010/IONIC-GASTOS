<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bancos extends Model
{
    //
    public $timestamps = false;

    public function cuentas(){
        return $this->hasOne(Cuentas::class,'cuenta_id');
    }
}
