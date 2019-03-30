
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
        future: getAllAlunos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if(!snapshot.hasData) 
          //   return CircularProgressIndicator();
          if (snapshot.connectionState == ConnectionState.waiting){
            return Container(
              child: Center(
                child: CircularProgressIndicator()
                ),
            );
          // } else if (!snapshot.hasData) {
          //   return Container(
          //     child: Center(child: Text("Snapshot sem dados"),),
          //   );
           } else if (snapshot.hasError) {
            return Container(
              child: Center(child: Text(snapshot.error.toString()),),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${snapshot.data[index].nome}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${snapshot.data[index].curso}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 15.0,
                            child: Text(
                              '${snapshot.data[index].semestre}º',
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
                              color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                      onTap: (){},
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}