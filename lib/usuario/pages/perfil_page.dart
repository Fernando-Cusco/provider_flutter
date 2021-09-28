import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/usuario/provider/usuario_provider.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _formKey = GlobalKey<FormState>();
  bool _estado;
  TextEditingController _txtNombresCtrl;
  TextEditingController _txtUsernameCtrl;
  @override
  void initState() {
    super.initState();
    final _usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    _txtNombresCtrl = TextEditingController(text: _usuarioProvider.nombres);
    _txtUsernameCtrl = TextEditingController(text: _usuarioProvider.username);
    _estado = _usuarioProvider.estado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _txtNombres(),
              _txtUsername(),
              _txtEstado(),
              _btnSubmit()
            ],
          )
        )
      ),
    );
  }

  Widget _txtNombres() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: _txtNombresCtrl,
        validator: (value) {
          if (value.isEmpty) {
            return 'Nombres requeridos';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Nombres',
          suffixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _txtUsername() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: _txtUsernameCtrl,
        validator: (value) {
          if (value.isEmpty) {
            return 'Username requerido';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          suffixIcon: Icon(Icons.fingerprint),
        ),
      ),
    );
  }

  Widget _txtEstado() {
    final _usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    return Container(
      child: Switch(
        value: _usuarioProvider.estado,
        onChanged: (value) {
          _usuarioProvider.estado = value;
          setState(() {});
        },
        activeTrackColor: Colors.yellow,
        activeColor: Colors.orangeAccent,
      ),
    );
  }

  Widget _btnSubmit() {
    final _usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    final snackBar = SnackBar(
      content: Text('Perfil actualizado'),
      duration: Duration(milliseconds: 2000),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {},
      ),
    );
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          _usuarioProvider.nombres = _txtNombresCtrl.text;
          _usuarioProvider.username = _txtUsernameCtrl.text;
          setState(() {});
        }
      },
      child: Text('Guardar'),
    );
  }
}
