import 'package:flutter/material.dart';

class ClassificacaoPage extends StatelessWidget {
  const ClassificacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent.withOpacity(0.8),
      child: const Padding(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Text(
            "Esta página ainda está em desenvolvimento",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
