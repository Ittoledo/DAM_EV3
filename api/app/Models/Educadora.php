<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Educadora extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'educadoras';
    protected $primaryKey = 'rut_educadora';
    public $incrementing = false;
    protected $keyType = 'integer';
    public $timestamps = false;

    public function nivel(){
        return $this->belongsTo(Nivel::class);
    }
}
