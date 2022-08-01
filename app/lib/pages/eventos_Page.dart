<<<<<<< HEAD
import 'package:app/pages/agrega/form_evento.dart';
import 'package:app/pages/lista/lista_Eventos.dart';
=======
>>>>>>> parent of db7298e (forms)
import 'package:flutter/material.dart';

import 'borra/borra_eventos.dart';
import 'edita/edita_eventos_list.dart';

class eventosPage extends StatefulWidget {
  eventosPage({Key? key}) : super(key: key);

  @override
  State<eventosPage> createState() => _eventosPageState();
}

class _eventosPageState extends State<eventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Eventos"),
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
                            MaterialPageRoute(builder: (_) => formEvento()));
                      }
                      if (index == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => listaEventos()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BorraEventos()));
                      }
                      if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditaEventosList()));
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
