import 'package:flutter/material.dart';
import 'package:app/providers/firebase_service.dart';

class EditaNews extends StatefulWidget {
  final String id;
  final String link;
  final String titulo;
  final String descripcion;
  final String fecha;
  final String hora;
  EditaNews(
      this.id, this.link, this.titulo, this.descripcion, this.fecha, this.hora,
      {Key? key})
      : super(key: key);

  @override
  State<EditaNews> createState() => _EditaNewsState();
}

class _EditaNewsState extends State<EditaNews> {
  final formKey = GlobalKey<FormState>();
  TextEditingController linkCtrl = TextEditingController();
  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();
  TextEditingController horaCtrl = TextEditingController();
  String errLink = '';
  String errTitulo = '';
  String errDescripcion = '';
  String errFecha = '';
  String errHora = '';

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
                        children: [Icon(Icons.camera_alt, color: Colors.blue)],
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
                    "Edicion Noticia",
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
                          controller: linkCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.red[300],
                              ),
                              labelText: 'Link',
                              hintText: widget.link,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: tituloCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Titulo',
                              hintText: widget.titulo,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: descripcionCtrl,
                          keyboardType: TextInputType.number,
                          maxLines: 5,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Descripcion',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: fechaCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Fecha',
                              hintText: widget.fecha,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: horaCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'Hora',
                              hintText: widget.hora,
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Editar'),
                            onPressed: () {
                              FirestoreService().newsEditar(
                                  widget.id,
                                  linkCtrl.text,
                                  tituloCtrl.text,
                                  descripcionCtrl.text,
                                  fechaCtrl.text,
                                  horaCtrl.text);

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
