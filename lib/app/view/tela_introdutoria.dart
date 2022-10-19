import 'package:flutter/material.dart';

class TelaIntrodutoria extends StatelessWidget {
  const TelaIntrodutoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://lote44.com.br/wp-content/uploads/2022/04/lote44_logo2.png"),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: const Text("ENTRAR"),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, "/loginPage"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
