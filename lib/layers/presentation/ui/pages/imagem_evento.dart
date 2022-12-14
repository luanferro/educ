import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImagemEvento extends StatelessWidget {
  final String imagem_recebida;

  const ImagemEvento({super.key, required this.imagem_recebida});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pop(context);
      }),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Image.network(imagem_recebida, scale: 0.2),
        ),
      ),
    );
  }
}
