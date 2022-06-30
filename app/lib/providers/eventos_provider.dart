/*
## Metodos para eventos:
## getEventos() -> Lista todas los eventos de la BD
## getEvento(id) -> Lista los datos del evento con dicho id
## eventosAdd(data) -> Agrega un evento a la BD con los datos entregados
## eventosEdit(data) -> Edita un evento de la BD con los datos entregados
## eventosDelete(id) -> Borra el evento de la BD con dicho id
*/

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class eventosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Return list eventos
  Future<List<dynamic>> getEventos() async {
    var uri = Uri.parse('$apiURL/eventos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Return 1 evento
  Future<LinkedHashMap<String, dynamic>> getEvento(BigInt id) async {
    var uri = Uri.parse('$apiURL/eventos/$id');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //Add 1 evento
  Future<LinkedHashMap<String, dynamic>> eventosAdd(
      BigInt id, String nombre, BigInt rut_nino) async {
    var uri = Uri.parse('$apiURL/niveles');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'nombre': nombre,
          'rut_nino': rut_nino
        }));

    return json.decode(respuesta.body);
  }

  //Edit 1 evento
  Future<LinkedHashMap<String, dynamic>> eventosEdit(
      BigInt id, String nombre, BigInt rut_nino) async {
    var uri = Uri.parse('$apiURL/eventos/$id');
    var respuesta = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'nombre': nombre,
          'rut_nino': rut_nino
        }));

    return json.decode(respuesta.body);
  }

  //Delete 1 evento
  Future<bool> eventosDelete(BigInt id) async {
    var uri = Uri.parse('$apiURL/eventos/$id');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
