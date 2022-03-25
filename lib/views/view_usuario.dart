import 'package:flutter/material.dart';
import 'package:flutter_crud/controllers/controller_usuarios.dart';
import 'package:flutter_crud/model/usuario.dart';
import 'package:provider/provider.dart';

class ViewCadastroUsuario extends StatefulWidget {
  const ViewCadastroUsuario({Key? key}) : super(key: key);

  @override
  State<ViewCadastroUsuario> createState() => _ViewCadastroUsuarioState();
}

class _ViewCadastroUsuarioState extends State<ViewCadastroUsuario> {
  late Usuario? _usuario;

  late TextEditingController txtNome;
  late TextEditingController txtEmail;
  late TextEditingController txtAvatar;

  late FocusNode txtFocusNome;
  late FocusNode txtFocusEmail;
  late FocusNode txtFocusAvatar;

  @override
  void initState() {
    super.initState();

    txtFocusNome = FocusNode();
    txtFocusEmail = FocusNode();
    txtFocusAvatar = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _usuario = ModalRoute.of(context)?.settings.arguments as Usuario?;
    _usuario ??= Usuario(id: '', nome: '', email: '', avatarUrl: '');

    txtNome = TextEditingController(text: _usuario?.nome);
    txtEmail = TextEditingController(text: _usuario?.email);
    txtAvatar = TextEditingController(text: _usuario?.avatarUrl);
  }

  @override
  void dispose() {
    txtNome.dispose();
    txtEmail.dispose();
    txtAvatar.dispose();

    txtFocusAvatar.dispose();
    txtFocusEmail.dispose();
    txtFocusNome.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    final controller = Provider.of<ControllerUsuarios>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid != null && isValid != false) {
                _form.currentState?.save();

                if (_usuario!.id!.isEmpty) {
                  controller.add(Usuario(
                      id: '',
                      nome: _usuario!.nome,
                      email: _usuario!.email,
                      avatarUrl: _usuario!.avatarUrl));
                } else {
                  controller.update(_usuario!);
                }

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
                  autofocus: true,
                  focusNode: txtFocusNome,
                  decoration:
                      const InputDecoration(labelText: 'Nome do usuário'),
                  controller: txtNome,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Informe o nome do Usuário';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _usuario!.nome = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(txtFocusEmail);
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  focusNode: txtFocusEmail,
                  controller: txtEmail,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Informe um e-mail para o usuário';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _usuario!.email = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(txtFocusAvatar);
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Url do Avatar'),
                  focusNode: txtFocusAvatar,
                  controller: txtAvatar,
                  onSaved: (value) {
                    _usuario!.avatarUrl = value ?? '';
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(txtFocusNome);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
