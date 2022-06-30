import 'package:flutter/material.dart';
import 'package:app/providers/eventos_provider.dart';

class listaEventos extends StatelessWidget {
  const listaEventos({Key? key}) : super(key: key);

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
          child: FutureBuilder(
            future: eventosProvider().getEventos(),
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
                  var prod = snap.data[index];
                  return ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.asset('assets/ui_evento.png',
                          fit: BoxFit.cover),
                    ),
                    title: Text('Nombre evento: ' + prod['nombre']),
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
