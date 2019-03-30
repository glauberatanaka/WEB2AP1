import 'package:flutter/material.dart';
import 'package:web2ap1_app/models/aluno.dart';

class VisualizarAluno extends StatelessWidget {
  final Aluno aluno;

  //Exige Proposta no construtor
  VisualizarAluno({Key key, @required this.aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(aluno.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(aluno.curso),
      ),
    );
  }
} 