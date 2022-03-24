import 'package:flutter/material.dart';
import 'package:flutter_crud/controllers/controller_usuarios.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/view_lista_usuarios.dart';
import 'package:flutter_crud/views/view_usuario.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControllerUsuarios(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.home: (context) => const ViewListaUsuarios(),
          AppRoutes.usuario: (context) => const ViewCadastroUsuario()
        },
      ),
    );
  }
}
