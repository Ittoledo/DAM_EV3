import 'package:flutter/material.dart';

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
      ),
    );
  }
}
