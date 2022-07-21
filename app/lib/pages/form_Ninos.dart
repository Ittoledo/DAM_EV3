import 'package:flutter/material.dart';
import 'package:app/providers/ninos_provider.dart';

class formNinos extends StatefulWidget {
  @override
  State<formNinos> createState() => _formNinosState();
}

class _formNinosState extends State<formNinos> {
  List<String> items = ['medio menor', 'medio mayor', 'Playgroup'];
  String? selectItem = 'medio menor';
  final formKey = GlobalKey<FormState>();

  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController id_nivelCtrl = TextEditingController();

  String errRut = '';
  String errNombre = '';
  String errApellido = '';

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
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'selecciona una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.image, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'CANCELAR',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
                    "Registrar niño/a",
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
                          controller: rutCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.calendar_view_day,
                                color: Colors.red[300],
                              ),
                              labelText: 'Rut',
                              helperText: '123455678',
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
                              labelText: 'Nombre',
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
                              border: OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: DropdownButton(
                            value: selectItem,
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 24),
                                    )))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectItem = item.toString()),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
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
                            child: Text('Agregar'),
                            onPressed: () async {
                              int rutint = int.tryParse(rutCtrl.text) ?? 0;
                              int id_nivel = int.tryParse(rutCtrl.text) ?? 0;
                              BigInt rut = BigInt.from(rutint);
                              var respuesta = await NinosProvider().ninosAdd(
                                rut,
                                apellidoCtrl.text.trim(),
                                nombreCtrl.text.trim(),
                                id_nivel,
                              );

                              if (respuesta['message'] != null) {
                                //Rut_nino
                                if (respuesta['errors']['rut_nino'] != null) {
                                  errRut = respuesta['errors']['rut_nino'][0];
                                }

                                //nombre
                                if (respuesta['errors']['nombre'] != null) {
                                  errNombre = respuesta['errors']['nombre'][0];
                                }

                                //Apellido
                                if (respuesta['errors']['apellido'] != null) {
                                  errApellido =
                                      respuesta['errors']['apellido'][0];
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
