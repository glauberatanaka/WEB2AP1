import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisualizarAluno extends StatelessWidget {
  final DocumentSnapshot aluno;

  //Exige Proposta no construtor
  VisualizarAluno({Key key, @required this.aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do aluno"),
      ),
      body: Column(
        children: <Widget>[
          Divider(height: 5.0),
          infoBox("Nome", aluno['nome']),
          infoBox("Idade", aluno['idade'].toString()),
          infoBox("Curso", aluno['curso']),
          infoBox("Semestre", aluno['semestre'].toString()),
        ],
      )
    );
  }

  Container infoBox(String field, dynamic data) {
    return Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: caixaPadrao(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(height: 3.0),
              Text(
                field,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              ),
              Text(                  
                data,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        );
  }

  BoxDecoration caixaPadrao() {
    return BoxDecoration(
      border: Border.all(
        width: 3.0
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
      ),
    );
  }


}