import 'package:entregas_application/app/view/lista/entregas_lista.dart';
import 'package:entregas_application/app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'app/view/entregas_form.dart';
import 'app/view/lista/entregas_lista_dinamica.dart';

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
        primarySwatch: Colors.pink,
      ),
      //home: LoginPage(),
      routes: {
        '/': (context) => EntregasLista(),
        '/entregasFormDAO': (context) => EntregasForm()
      },
    );
  }
}
