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

  Stream<QuerySnapshot> ninos() {
    return FirebaseFirestore.instance.collection('ninos').snapshots();
  }

  Future ninosAdd(
      String rut_nino, String nombre, String apellido, int? id_nivel) {
    return FirebaseFirestore.instance.collection('ninos').doc().set({
      'rut_nino': rut_nino,
      'nombre': nombre,
      'apellido': apellido,
      'id_nivel': id_nivel,
    });
  }

  Future ninosDelete(String id) {
    return FirebaseFirestore.instance.collection('ninos').doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNino(
      String rut_nino) async {
    return await FirebaseFirestore.instance
        .collection('ninos')
        .doc(rut_nino)
        .get();
  }

  Future ninosEditar(String id, String nombre, String apellido, int? id_nivel) {
    return FirebaseFirestore.instance.collection('ninos').doc(id).update({
      'nombre': nombre,
      'apellido': apellido,
      'id_nivel': id_nivel,
    });
  }

  Stream<QuerySnapshot> eventos() {
    return FirebaseFirestore.instance.collection('eventos').snapshots();
  }

  Future eventosAdd(String nombre, String rut_nino) {
    return FirebaseFirestore.instance.collection('eventos').doc().set({
      'nombre': nombre,
      'rut_nino': rut_nino,
    });
  }

  Future eventosDelete(String id) {
    return FirebaseFirestore.instance.collection('eventos').doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getEvento(String id) async {
    return await FirebaseFirestore.instance.collection('eventos').doc(id).get();
  }

  Future eventosEditar(String id, String nombre, String rut_nino) {
    return FirebaseFirestore.instance.collection('eventos').doc(id).update({
      'nombre': nombre,
      'rut_nino': rut_nino,
    });
  }

  Stream<QuerySnapshot> niveles() {
    return FirebaseFirestore.instance.collection('niveles').snapshots();
  }

  Future nivelesAdd(String id, String nombre) {
    return FirebaseFirestore.instance
        .collection('niveles')
        .doc(id)
        .set({'nombre': nombre});
  }

  Future nivelesDelete(String id) {
    return FirebaseFirestore.instance.collection('niveles').doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNivel(String id) async {
    return await FirebaseFirestore.instance.collection('niveles').doc(id).get();
  }

  Future nivelesEditar(String id, String nombre) {
    return FirebaseFirestore.instance
        .collection('niveles')
        .doc(id)
        .update({'nombre': nombre});
  }

  Stream<QuerySnapshot> news() {
    return FirebaseFirestore.instance.collection('news').snapshots();
  }

  Future newsAdd(String link, String titulo, String descripcion, String fecha,
      String hora) {
    return FirebaseFirestore.instance.collection('news').doc().set({
      'link': link,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha,
      'hora': hora
    });
  }

  Future newsDelete(String id) {
    return FirebaseFirestore.instance.collection('news').doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNews(String id) async {
    return await FirebaseFirestore.instance.collection('news').doc(id).get();
  }

  Future newsEditar(String id, String link, String titulo, String descripcion,
      String fecha, String hora) {
    return FirebaseFirestore.instance.collection('news').doc(id).update({
      'link': link,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha,
      'hora': hora
    });
  }
}
