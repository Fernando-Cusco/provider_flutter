import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/usuario/pages/inicio_page.dart';
import 'package:provider_state/usuario/pages/perfil_page.dart';
import 'package:provider_state/usuario/pages/preferencias_page.dart';
import 'package:provider_state/usuario/pages/usuario_page.dart';
import 'package:provider_state/usuario/provider/usuario_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsuarioProvider())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: 'inicio',
          routes: {
            'inicio': (context) => InicioPage(),
            'perfil': (context) => PerfilPage(),
            'preferencias': (context) => PreferenciasPage(),
            'usuario': (context) => UsuarioPage(),
          },
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: InicioPage()),
    );
  }
}
