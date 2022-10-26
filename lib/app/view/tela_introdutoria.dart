import 'package:flutter/material.dart';

class TelaIntrodutoria extends StatelessWidget {
  const TelaIntrodutoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink.image(
              image: const AssetImage('assets/44.png'),
              width: 200,
              height: 200,
              child: InkWell(
                onLongPress: () =>
                    Navigator.popAndPushNamed(context, "/loginPage"),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),

              /*Image.network(
                "https://lote44.com.br/wp-content/uploads/2022/04/lote44_logo2.png"),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: const Text("Seja bem vindo!"),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, "/loginPage"),
                ),
              ),
            ),*/
            )
          ],
        ),
      ),
    );
  }
}
