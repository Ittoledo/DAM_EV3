<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nivel extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'niveles';
    public $timestamps = false;

    public function ninos(){
        return $this->hasMany(Nino::class);
    }

    public function educadoras(){
        return $this->hasMany(Educadora::class);
    }
}
