import 'package:app/providers/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class listaNiveles extends StatelessWidget {
  const listaNiveles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Niveles'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: StreamBuilder(
            stream: FirestoreService().niveles(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
              if (!snap.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  var nivel = snap.data!.docs[index];
                  return ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.asset('assets/ui_niveles.png',
                          fit: BoxFit.cover),
                    ),
                    title: Text('Nombre nivel: ' + nivel['nombre']),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
