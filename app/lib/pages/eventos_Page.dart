import 'package:flutter/material.dart';

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
      ),
    );
  }
}
