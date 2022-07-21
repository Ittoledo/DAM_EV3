import 'package:app/pages/edita/edita_news_list.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/categoriaMenu.dart';
import 'package:app/pages/agrega/form_news.dart';
import 'package:app/pages/borra/borra_news.dart';
import 'package:app/pages/lista/lista_news.dart';

class newsGestion extends StatefulWidget {
  newsGestion({Key? key}) : super(key: key);

  @override
  State<newsGestion> createState() => _newsGestionState();
}

class _newsGestionState extends State<newsGestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Niños"),
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
                            MaterialPageRoute(builder: (_) => FormNews()));
                      }
                      if (index == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ListaNews()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BorraNews()));
                      }
                      if (index == 3) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditaNewsList()));
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
