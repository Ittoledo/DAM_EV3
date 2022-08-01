<<<<<<< HEAD
import 'package:app/pages/edita/edita_educadoras_list.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/agrega/form_educadora.dart';
import 'package:app/modelos/categoriaMenu.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> parent of db7298e (forms)

import 'borra/borra_educadoras.dart';
import 'lista/lista_Educadoras.dart';

class educadorasPage extends StatefulWidget {
  educadorasPage({Key? key}) : super(key: key);

  @override
  State<educadorasPage> createState() => _educadorasPageState();
}

class _educadorasPageState extends State<educadorasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Educadoras"),
<<<<<<< HEAD
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
                            MaterialPageRoute(builder: (_) => formEdu()));
                      }
                      if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => listaEducadoras()));
                      }
                      if (index == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => borraEducadoras()));
                      }
                      if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditaEducadoraList()));
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
=======
>>>>>>> parent of db7298e (forms)
      ),
    );
  }
}
