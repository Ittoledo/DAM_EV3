<?php

namespace App\Http\Controllers;

use App\Models\Educadora;
use Illuminate\Http\Request;

class EducadoraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Educadora::orderBy('rut_educadora')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $educadora = new Educadora();
        $educadora->rut_educadora = $request->rut_educadora;
        $educadora->nombre = $request->nombre;
        $educadora->apellido = $request->apellido;
        $educadora->id_nivel = $request->id_nivel;
        $educadora->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Educadora $educadora)
    {
        return $educadora;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Educadora $educadora)
    {
        $educadora->rut_educadora = $request->rut_educadora;
        $educadora->nombre = $request->nombre;
        $educadora->apellido = $request->apellido;
        $educadora->id_nivel = $request->id_nivel;
        $educadora->save();
        return $educadora;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Educadora $educadora)
    {
        $educadora->delete();
    }
}
