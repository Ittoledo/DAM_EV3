<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNivelesNinos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ninos', function (Blueprint $table){
            $table->unsignedBigInteger('id_nivel')->nullable();
            $table->unsignedBigInteger('id_evento')->nullable();
            $table->foreign('id_nivel')->references('id')->on('niveles');
            $table->foreign('id_evento')->references('id')->on('eventos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
