import 'package:flutter/material.dart';

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
      ),
    );
  }
}
