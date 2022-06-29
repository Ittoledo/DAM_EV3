/*
## Metodos para ninos:
## getNinos() -> Lista todos los ninos de la BD
## getNino(rut_nino) -> Lista los datos del nino con dicho rut
## ninosAdd(data) -> Agrega un nino a la BD con los datos entregados
## ninosEdit(data) -> Edita un nino de la BD con los datos entregados
## ninosDelete(rut) -> Borra al nino de la BD con dicho rut
*/

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NinosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Return list ninos
  Future<List<dynamic>> getNinos() async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Return 1 nino
  Future<LinkedHashMap<String, dynamic>> getNino(BigInt rut_nino) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //Add 1 nino
  Future<LinkedHashMap<String, dynamic>> ninosAdd(
      BigInt rut_nino, String nombre, String apellido, int id_nivel) async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'nombre': nombre,
          'apellido': apellido,
          'id_nivel': id_nivel
        }));

    return json.decode(respuesta.body);
  }

  //Edit 1 nino
  Future<LinkedHashMap<String, dynamic>> ninosEdit(
      BigInt rut_nino, String nombre, String apellido, int id_nivel) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'nombre': nombre,
          'apellido': apellido,
          'id_nivel': id_nivel
        }));

    return json.decode(respuesta.body);
  }

  //Delete 1 nino
  Future<bool> ninosDelete(BigInt rut_nino) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
