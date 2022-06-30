import 'package:flutter/material.dart';
import 'package:app/providers/niveles_provider.dart';

class formNivel extends StatefulWidget {
  const formNivel({Key? key}) : super(key: key);

  @override
  State<formNivel> createState() => _formNivelState();
}

class _formNivelState extends State<formNivel> {
  final formKey = GlobalKey<FormState>();

  TextEditingController idCtrl = TextEditingController();

  TextEditingController nombreCtrl = TextEditingController();

  String errId = '';

  String errNombre = '';

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
                    "Registrar nuevo nivel",
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
                              helperText: '1',
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
                              labelText: 'Nombre nivel',
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
                              ;
                              BigInt id = BigInt.from(idint);

                              var respuesta =
                                  await nivelesProvider().nivelesAdd(
                                id,
                                nombreCtrl.text.trim(),
                              );

                              if (respuesta['message'] != null) {
                                //id_evento
                                if (respuesta['errors']['id'] != null) {
                                  errId = respuesta['errors']['id'][0];
                                }

                                //nombre
                                if (respuesta['errors']['nombre'] != null) {
                                  errNombre = respuesta['errors']['nombre'][0];
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