/*
## Metodos para educadoras:
## getEducadoras() -> Lista todas las educadoras de la BD
## getEducadora(rut_educadora) -> Lista los datos de la educadora con dicho rut
## educadorasAdd(data) -> Agrega una educadora a la BD con los datos entregados
## educadorasEdit(data) -> Edita una educadora de la BD con los datos entregados
## educadorasDelete(rut) -> Borra la educadora de la BD con dicho rut
*/
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot> educadoras() {
    return FirebaseFirestore.instance.collection('educadoras').snapshots();
  }

  Future educadorasAdd(
      String rut_educadora, String nombre, String apellido, int? id_nivel) {
    return FirebaseFirestore.instance.collection('educadoras').doc().set({
      'rut_educadora': rut_educadora,
      'nombre': nombre,
      'apellido': apellido,
      'id_nivel': id_nivel,
    });
  }

  Future educadorasDelete(String id) {
    return FirebaseFirestore.instance.collection('educadoras').doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getEducadora(
      String rut_educadora) async {
    return await FirebaseFirestore.instance
        .collection('educadoras')
        .doc(rut_educadora)
        .get();
  }

  Future educadorasEditar(
      String id, String nombre, String apellido, int? id_nivel) {
    return FirebaseFirestore.instance.collection('educadoras').doc(id).update({
      'nombre': nombre,
      'apellido': apellido,
      'id_nivel': id_nivel,
    });
  }
}
