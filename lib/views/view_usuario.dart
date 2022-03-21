import 'package:flutter/material.dart';
import 'package:flutter_crud/controllers/ControllerUsuarios.dart';
import 'package:flutter_crud/model/usuario.dart';
import 'package:provider/provider.dart';

class ViewCadastroUsuario extends StatelessWidget {
  ViewCadastroUsuario({Key? key}) : super(key: key);

  late Usuario _usuario;

  void _loadUsuario(Usuario? user) {
    if (user == null) {
      _usuario = Usuario();
    } else {
      _usuario = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    TextEditingController txtNome = TextEditingController();
    TextEditingController txtEmail = TextEditingController();
    TextEditingController txtAvatar = TextEditingController();
    final controller = Provider.of<ControllerUsuarios>(context, listen: false);

    _loadUsuario(ModalRoute.of(context)?.settings.arguments as Usuario);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              final bool isValid = _form.currentState?.validate() ?? false;

              if (isValid) {
                controller.add(Usuario(
                    id: '',
                    nome: txtNome.text,
                    email: txtEmail.text,
                    avatarUrl: txtAvatar.text));

                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _usuario.nome,
                decoration: const InputDecoration(labelText: 'Nome do usuário'),
                controller: txtNome,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Informe o nome do Usuário';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: _usuario.email,
                decoration: const InputDecoration(labelText: 'E-mail'),
                controller: txtEmail,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Informe um e-mail para o usuário';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: _usuario.avatarUrl,
                decoration: const InputDecoration(labelText: 'Url do Avatar'),
                controller: txtAvatar,
              )
            ],
          ),
        ),
      ),
    );
  }
}
