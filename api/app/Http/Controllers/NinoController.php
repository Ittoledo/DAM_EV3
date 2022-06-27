<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;

class NinoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Nino::orderBy('rut_nino')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nino = new Nino;
        $nino->rut_nino = $request->rut_nino;
        $nino->nombre = $request->nombre;
        $nino->apellido = $request->apellido;
        $nino->id_nivel = $request->id_nivel;
        $nino->id_evento = $request->id_evento;
        $nino->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Nino $nino)
    {
        return $nino;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Nino $nino)
    {
        $nino->rut_nino = $request->rut_nino;
        $nino->nombre = $request->nombre;
        $nino->apellido = $request->apellido;
        $nino->id_nivel = $request->id_nivel;
        $nino->id_evento = $request->id_evento;
        $nino->save();
        return $nino;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nino $nino)
    {
        $nino->delete();
    }
}
