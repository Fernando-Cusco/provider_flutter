import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/usuario/provider/usuario_provider.dart';

class UsuarioPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://wallpapercave.com/wp/wp5123161.jpg', fit: BoxFit.fill),
              title: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 120, left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_usuarioProvider.nombres),
                    Text(_usuarioProvider.username),
                    Text((_usuarioProvider.estado)? 'Activo': 'Inactivo'),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}