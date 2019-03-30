
import 'package:flutter/material.dart';
import 'package:web2ap1_app/models/aluno.dart';
import 'package:web2ap1_app/service/firestoreService.dart';

import 'package:web2ap1_app/ui/visualizarAluno.dart';

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
  FirestoreService<Aluno> alunoDB = new FirestoreService<Aluno>('alunos');

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
      body: StreamBuilder(
        stream: alunoDB.getList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Container(
              child: Center(
                child: CircularProgressIndicator()
                ),
            );
          } else if (!snapshot.hasData) {
            return Container(
              child: Center(child: Text("Snapshot sem dados"),),
            );
           } else if (snapshot.hasError) {
            return Container(
              child: Center(child: Text(snapshot.error.toString()),),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${snapshot.data.documents[index]['nome']}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${snapshot.data.documents[index]['curso']}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 17.0,
                            child: Text(
                              '${snapshot.data.documents[index]['semestre']}º',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white
                              )
                            ),
                          ),
                          Text(
                            "sem",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey,
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => VisualizarAluno(aluno: snapshot.data.documents[index])
                          )
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Adicionar novo Aluno',
          child: new Icon(Icons.add),
          backgroundColor: Colors.black87,
          onPressed: () {
          }
      ),
    );
  }
}