import 'package:entregas_application/app/view/login_page.dart';
import 'package:entregas_application/app/view/tela_introdutoria.dart';
import 'package:entregas_application/home.dart';
import 'package:flutter/material.dart';
import 'app/lista/entregas_lista_dinamica.dart';
import 'app/view/entregas_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //home: LoginPage(),
      routes: {
        '/': (context) => const TelaIntrodutoria(),
        '/loginPage': (context) => LoginPage(),
        '/entregasListaDinamica': (context) => EntregasListaDinamica(),
        '/entregasForm': (context) => EntregasForm(),
        '/card': (context) => Home()
      },
    );
  }
}
