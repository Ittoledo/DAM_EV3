import 'package:flutter/material.dart';
import 'package:app/providers/firebase_service.dart';

class EditaNino extends StatefulWidget {
  final String id;
  final String nombre;
  final String apellido;
  final int? id_nivel;
  EditaNino(this.id, this.nombre, this.apellido, this.id_nivel, {Key? key})
      : super(key: key);

  @override
  State<EditaNino> createState() => _EditaNinoState();
}

class _EditaNinoState extends State<EditaNino> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController id_nivelCtrl = TextEditingController();
  String errNombre = '';
  String errApellido = '';
  String errId = '';

  opciones(Context) {
    showDialog(
        context: context,
        builder: (BuildContext Context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'tomar una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.camera_alt, color: Colors.blue)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.fact_check, color: Colors.red[300], size: 150),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Edicion Nino",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red[300],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        TextFormField(
                          controller: nombreCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.red[300],
                              ),
                              labelText: 'Nombre',
                              hintText: widget.nombre,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: apellidoCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Apellido',
                              hintText: widget.apellido,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: id_nivelCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Nivel',
                              hintText: widget.id_nivel.toString(),
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              opciones(context);
                            },
                            child: Text('selecciona una imagen'),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Editar'),
                            onPressed: () {
                              int id_nivel =
                                  int.tryParse(id_nivelCtrl.text) ?? 0;
                              FirestoreService().ninosEditar(widget.id,
                                  nombreCtrl.text, apellidoCtrl.text, id_nivel);

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
