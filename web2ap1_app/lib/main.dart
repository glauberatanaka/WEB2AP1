import 'package:flutter/material.dart';
import 'package:web2ap1_app/ui/listarAlunos.dart';

void main() => runApp(WEB2AP1APP());

class WEB2AP1APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliação Web 2',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ListarAlunos(title: 'Avaliação Web 2'),
      debugShowCheckedModeBanner: false,
    );
  }
}