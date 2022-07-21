import 'package:flutter/material.dart';
import 'package:app/providers/eventos_service.dart';

class formEvento extends StatefulWidget {
  const formEvento({Key? key}) : super(key: key);

  @override
  State<formEvento> createState() => _formEventoState();
}

class _formEventoState extends State<formEvento> {
  final formKey = GlobalKey<FormState>();

  TextEditingController idCtrl = TextEditingController();

  TextEditingController nombreCtrl = TextEditingController();

  TextEditingController rutNinoCtrl = TextEditingController();

  String errId = '';

  String errNombre = '';

  String errApellido = '';

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
                    "Registrar Evento",
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
                          validator: (String? valor) {},
                          controller: idCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.calendar_view_day,
                                color: Colors.red[300],
                              ),
                              labelText: 'numero de id',
                              helperText: '12345',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: nombreCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.red[300],
                              ),
                              labelText: 'Nombre evento',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: rutNinoCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.red[300],
                              ),
                              labelText: 'rut nino',
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Agregar'),
                            onPressed: () async {
                              int idint = int.tryParse(idCtrl.text) ?? 0;
                              int rutint = int.tryParse(rutNinoCtrl.text) ?? 0;
                              BigInt id = BigInt.from(idint);
                              BigInt rut = BigInt.from(rutint);
                              var respuesta =
                                  await eventosProvider().eventosAdd(
                                id,
                                nombreCtrl.text.trim(),
                                rut,
                              );

                              if (respuesta['message'] != null) {
                                //id_evento
                                if (respuesta['errors']['id_evento'] != null) {
                                  errId = respuesta['errors']['id_evento'][0];
                                }

                                //nombre
                                if (respuesta['errors']['nombre'] != null) {
                                  errNombre = respuesta['errors']['nombre'][0];
                                }

                                //rut nino
                                if (respuesta['errors']['rut_nino'] != null) {
                                  errApellido =
                                      respuesta['errors']['rut_nino'][0];
                                }

                                setState(() {});
                                return;
                              }

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
