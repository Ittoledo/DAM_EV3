import 'package:app/pages/educadoras_Page.dart';
import 'package:app/pages/eventos_Page.dart';
import 'package:app/pages/news_Gestion.dart';
import 'package:app/pages/ninos_Page.dart';
import 'package:app/pages/niveles_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/categoria.dart';

import '../widgets/widgets.dart';

class menuPage extends StatefulWidget {
  menuPage({Key? key}) : super(key: key);

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU GUARDERIA"),
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: Container(
        child: GridView.builder(
            itemCount: Menu.length,
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
                            MaterialPageRoute(builder: (_) => ninosPage()));
                      }
                      if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => educadorasPage()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => nivelesPage()));
                      }
                      if (index == 3) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => eventosPage()));
                      }
                      if (index == 4) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => newsGestion()));
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/" + Menu[index].foto,
                          width: 160,
                        ),
                        Text(Menu[index].nombre),
                      ],
                    ),
                  ));
            }),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
