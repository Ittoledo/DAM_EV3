import 'package:app/providers/firebase_service.dart';
import 'package:app/widgets/listWidget.dart';
import 'package:app/pages/detalleNoticas.dart';
import 'package:app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/ListItems.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class newsPage extends StatefulWidget {
  newsPage({Key? key}) : super(key: key);

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage>
    with SingleTickerProviderStateMixin {
  List<ListItem> listTiles = [
    ListItem(
        'https://picsum.photos/250?image=1',
        "Vacaciones de invierno",
        "Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "20 Julio 2022",
        "09:35"),
    ListItem(
        'https://picsum.photos/250?image=2',
        "Campaña de Vacunacion en el jardin",
        "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "18 Julio 2022",
        "10:21"),
    ListItem(
        'https://picsum.photos/250?image=3',
        "Reunion de apoderados julio 2022",
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "16 Julio 2022",
        "08:25"),
    ListItem(
        'https://picsum.photos/250?image=4',
        "Cuidado del medioambiente",
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "15 Julio 2022",
        "10:22"),
    ListItem(
        'https://picsum.photos/250?image=5',
        "Alumnos suspendidos por robar",
        "et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "08 Julio 2022",
        "19:24"),
    ListItem(
        'https://picsum.photos/250?image=6',
        "The standard Lorem Ipsum passage, used since the 1500s",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "08 Julio 2022",
        "10:20"),
    ListItem(
        'https://picsum.photos/250?image=7',
        "The standard Lorem Ipsum passage, used since the 1500s",
        "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "06 Julio 2022",
        "12:45"),
    ListItem(
        'https://picsum.photos/250?image=8',
        "The standard Lorem Ipsum passage, used since the 1500s",
        "aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "05 Julio 2022",
        "09:25")
  ];

  List<Tab> tabList = [
    Tab(
      child: Text("Lo mas nuevo"),
    ),
    Tab(
      child: Text("Lo mas visto"),
    ),
    Tab(
      child: Text("Importantes"),
    )
  ];

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110.0,
        backgroundColor: Colors.red[300],
        centerTitle: true,
        title: Text("NOTICIAS JARDIN"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.white,
            controller: _tabController,
            tabs: tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Expanded(
              child: StreamBuilder(
                stream: FirestoreService().news(),
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
                      var news = snap.data!.docs[index];
                      return ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.network(news['link'], fit: BoxFit.cover),
                        ),
                        title: Text('Titulo: ' + news['titulo']),
                        subtitle: Text('Fecha: ' + news['fecha']),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detalleNoticia(
                                      link: news['link'],
                                      titulo: news['titulo'],
                                      descripcion: news['descripcion'],
                                      fecha: news['fecha'],
                                      hora: news['hora'],
                                      tag: news['titulo'])));
                        },
                      );
                    },
                    //coment
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          )
        ],
      ),
      drawer: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return const NavigationDrawer();
            } else {
              return const NavigationDrawerLoggedOut();
            }
          }),
    );
  }
}
