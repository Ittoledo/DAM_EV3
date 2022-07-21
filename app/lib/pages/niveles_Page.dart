import 'package:app/pages/agrega/form_nivel.dart';
import 'package:app/pages/lista/lista_niveles.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/categoriaMenu.dart';

import 'borra/borra_niveles.dart';
import 'edita/edita_niveles_list.dart';

class nivelesPage extends StatefulWidget {
  nivelesPage({Key? key}) : super(key: key);

  @override
  State<nivelesPage> createState() => _nivelesPageState();
}

class _nivelesPageState extends State<nivelesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Niveles"),
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: Container(
        child: GridView.builder(
            itemCount: MenuC.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => formNivel()));
                      }
                      if (index == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => listaNiveles()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BorraNiveles()));
                      }
                      if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditaNivelesList()));
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/" + MenuC[index].foto,
                          width: 130,
                        ),
                        Text(MenuC[index].nombre),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
