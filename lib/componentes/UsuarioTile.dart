import 'package:flutter/material.dart';
import 'package:flutter_crud/model/usuario.dart';
import 'package:flutter_crud/routes/AppRoutes.dart';

class UsuarioTile extends StatelessWidget {
  final Usuario usuario;

  const UsuarioTile({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  Widget getAvatar(String? avatarUrl) {
    if (avatarUrl == null || avatarUrl.isEmpty) {
      return const CircleAvatar(
        child: Icon(Icons.person),
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getAvatar(usuario.avatarUrl),
      title: Text(usuario.nome!),
      subtitle: Text(usuario.email!),
      trailing: Container(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.usuario, arguments: usuario);
              },
              color: Colors.yellow,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Colors.red,
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
