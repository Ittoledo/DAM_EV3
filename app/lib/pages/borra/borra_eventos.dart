import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/providers/firebase_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BorraEventos extends StatelessWidget {
  const BorraEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Eventos'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: StreamBuilder(
            stream: FirestoreService().eventos(),
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
                  var evento = snap.data!.docs[index];
                  return ListTile(
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 64,
                        ),
                        child: Image.asset('assets/ui_profile.png',
                            fit: BoxFit.cover),
                      ),
                      title: Text('Evento: ' + evento['nombre']),
                      trailing: TextButton(
                        child: Icon(MdiIcons.trashCan, color: Colors.red),
                        onPressed: () {
                          FirestoreService().eventosDelete(evento.id);
                        },
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
