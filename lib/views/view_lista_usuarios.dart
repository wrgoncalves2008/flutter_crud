import 'package:flutter/material.dart';
import 'package:flutter_crud/componentes/usuario_tile.dart';
import 'package:flutter_crud/controllers/controller_usuarios.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ViewListaUsuarios extends StatelessWidget {
  const ViewListaUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Pode ser utilizado da forma abaixo também.
    //final listaUsuarios = Provider.of<ControllerUsuarios>(context);
    final ControllerUsuarios listaUsuarios = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.usuario);
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listaUsuarios.count,
        itemBuilder: (ctx, i) {
          return UsuarioTile(usuario: listaUsuarios.getUsuario(i));
        },
      ),
    );
  }
}
