<<<<<<< HEAD
import 'package:app/pages/agrega/form_Ninos.dart';
import 'package:app/pages/borra/borra_ninos.dart';
import 'package:app/pages/lista/lista_ninos.dart';
=======
>>>>>>> parent of db7298e (forms)
import 'package:flutter/material.dart';

import 'edita/edita_ninos_list.dart';

class ninosPage extends StatefulWidget {
  ninosPage({Key? key}) : super(key: key);

  @override
  State<ninosPage> createState() => _ninosPageState();
}

class _ninosPageState extends State<ninosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Niños"),
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
                            MaterialPageRoute(builder: (_) => formNinos()));
                      }
                      if (index == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => listaNinos()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BorraNinos()));
                      }
                      if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditaNinosList()));
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
