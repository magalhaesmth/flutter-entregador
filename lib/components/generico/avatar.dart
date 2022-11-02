import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String urlImagem;
  const Avatar({Key? key, required this.urlImagem}) : super(key: key);

  Widget criarAvatar(BuildContext context, double largura) {
    return CircleAvatar(
      backgroundImage: NetworkImage(urlImagem),
      radius: largura / 3,
    );
  }

  Widget criarAvatarGenerico(BuildContext context, double largura) {
    return CircleAvatar(
      child: Icon(
        Icons.person,
        size: largura / 2,
      ),
      radius: largura / 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return Uri.tryParse(urlImagem)!.isAbsolute
        ? criarAvatar(context, largura)
        : criarAvatarGenerico(context, largura);
  }
}
