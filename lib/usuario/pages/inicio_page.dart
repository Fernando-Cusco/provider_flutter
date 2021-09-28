import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Provider',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, 'usuario');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Inicio'),
            MaterialButton(
              textColor: Colors.green[400],
              onPressed: () {
                Navigator.pushNamed(context, 'perfil');
              },
              child: Text('Perfil'),
            ),
            MaterialButton(
              textColor: Colors.red[400],
              onPressed: () {
                Navigator.pushNamed(context, 'preferencias');
              },
              child: Text('Preferencias'),
            )
          ],
        ),
      ),
    );
  }
}
