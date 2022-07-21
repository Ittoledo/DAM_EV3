/*
## Metodos para educadoras:
## getEducadoras() -> Lista todas las educadoras de la BD
## getEducadora(rut_educadora) -> Lista los datos de la educadora con dicho rut
## educadorasAdd(data) -> Agrega una educadora a la BD con los datos entregados
## educadorasEdit(data) -> Edita una educadora de la BD con los datos entregados
## educadorasDelete(rut) -> Borra la educadora de la BD con dicho rut
*/

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class educadorasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Return list educadoras
  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Return 1 educadora
  Future<LinkedHashMap<String, dynamic>> getEducadora(int rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //Add 1 educadora
  Future<LinkedHashMap<String, dynamic>> educadorasAdd(
      int rut_educadora, String nombre, String apellido, int id_nivel) async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'nombre': nombre,
          'apellido': apellido,
          'id_nivel': id_nivel
        }));

    return json.decode(respuesta.body);
  }

  //Edit 1 educadora
  Future<LinkedHashMap<String, dynamic>> educadorasEdit(
      int rut_educadora, String nombre, String apellido, int id_nivel) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'nombre': nombre,
          'apellido': apellido,
          'id_nivel': id_nivel
        }));

    return json.decode(respuesta.body);
  }

  //Delete 1 educadora
  Future<bool> educadorasDelete(int rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
