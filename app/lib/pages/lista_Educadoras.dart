import 'package:flutter/material.dart';
import 'package:app/providers/educadoras_provider.dart';

class listaEducadoras extends StatelessWidget {
  const listaEducadoras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Educadoras'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: FutureBuilder(
            future: educadorasProvider().getEducadoras(),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  var edu = snap.data[index];
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
                    title: Text('Apellido Eduadora: ' + edu['apellido']),
                    subtitle: Text('Nombre Educadora: ' + edu['nombre']),
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
