
import 'package:flutter/material.dart';
import 'package:web2ap1_app/service/alunosService.dart';
import 'dart:async';

class ListarAlunos extends  StatefulWidget{
  ListarAlunos({Key key, this.title}) : super(key: key);
  final String title;

  // @override
  // Widget build(BuildContext context) {
  //   return new ListagemAlunos();
  // }
  @override
  _ListarAlunosState createState() => new _ListarAlunosState();
}

class _ListarAlunosState extends State<ListarAlunos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        title: Text("Web2 App"),
      ),
      body: FutureBuilder(
        future: obterTodosAlunos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if(!snapshot.hasData) 
          //   return CircularProgressIndicator();
          if(snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator()
                ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].nome),
                );
              },
            );
          }
        },
      ),
    );
  }
}