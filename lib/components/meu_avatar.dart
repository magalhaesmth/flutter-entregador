import 'package:flutter/material.dart';
import '/components/generico/avatar.dart';

class MeuAvatar extends StatelessWidget {
  const MeuAvatar({Key? key}) : super(key: key);
  final String urlImagem =
      "https://p2.trrsf.com/image/fget/cf/1200/900/middle/images.terra.com/2019/04/09/mc-zoi-de-gato.jpeg";

  @override
  Widget build(BuildContext context) {
    return Avatar(urlImagem: urlImagem);
  }
}
