/*
## Metodos para niveles:
## getNiveles() -> Lista todas las niveles de la BD
## getNivel(id) -> Lista los datos del nivel con dicho id
## nivelesAdd(data) -> Agrega un nivel a la BD con los datos entregados
## nivelesEdit(data) -> Edita un nivel de la BD con los datos entregados
## nivelesDelete(id) -> Borra el nivel de la BD con dicho id
*/

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class nivelesProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Return list niveles
  Future<List<dynamic>> getNiveles() async {
    var uri = Uri.parse('$apiURL/niveles');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Return 1 nivel
  Future<LinkedHashMap<String, dynamic>> getNivel(BigInt id) async {
    var uri = Uri.parse('$apiURL/niveles/$id');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //Add 1 nivel
  Future<LinkedHashMap<String, dynamic>> nivelesAdd(
      BigInt id, String nombre) async {
    var uri = Uri.parse('$apiURL/niveles');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{'id': id, 'nombre': nombre}));

    return json.decode(respuesta.body);
  }

  //Edit 1 nivel
  Future<LinkedHashMap<String, dynamic>> nivelesEdit(
      BigInt id, String nombre) async {
    var uri = Uri.parse('$apiURL/niveles/$id');
    var respuesta = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{'id': id, 'nombre': nombre}));

    return json.decode(respuesta.body);
  }

  //Delete 1 nivel
  Future<bool> nivelesDelete(BigInt id) async {
    var uri = Uri.parse('$apiURL/niveles/$id');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
