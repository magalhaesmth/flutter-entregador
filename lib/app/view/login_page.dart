import 'package:entregas_application/app/lista/entregas_lista_dinamica.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("44 Fast Delivery"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Color.fromARGB(255, 0x42, 0xA5, 0xF5),
            ],
            stops: [
              0.4,
              0.9,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: ListView(children: <Widget>[
          Image.asset("assets/44.png", width: 300, height: 200),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Informe seu nome de usuário",
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Informe sua senha",
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: const StadiumBorder(),
              ),
              child: Text('Entrar'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EntregasListaDinamica()))
              },
            ),
          ),
        ]),
      ),
    );
  }
}
      /*body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //center
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Image.asset("assets/44.png", width: 30, height: 20)
                ],
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Usuario",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => Navigator.popAndPushNamed(
                      context, "/entregasListaDinamica"),
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
