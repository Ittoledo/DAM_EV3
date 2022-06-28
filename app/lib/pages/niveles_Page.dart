import 'package:flutter/material.dart';

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
      ),
    );
  }
}
