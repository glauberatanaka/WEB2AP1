
import 'package:flutter/material.dart';
import 'package:web2ap1_app/models/aluno.dart';
import 'package:web2ap1_app/service/firestoreService.dart';
import 'package:web2ap1_app/ui/adicionarAluno.dart';
import 'package:lamp/lamp.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibrate/vibrate.dart';

import 'package:web2ap1_app/ui/visualizarAluno.dart';

class ListarAlunos extends  StatefulWidget{
  ListarAlunos({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListarAlunosState createState() => new _ListarAlunosState();
}

class _ListarAlunosState extends State<ListarAlunos> {
  FirestoreService<Aluno> alunoDB = new FirestoreService<Aluno>('alunos');
  
  bool _isOn = false;
  bool _canVibrate;

  @override
  void initState() {
    super.initState();
    initPermission();
    initVibratePermission();
  }

  initVibratePermission() async {
    var vibratePermission = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = vibratePermission;
    });
  }

  initPermission() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      print(permissions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web2 App - Glauber"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: (){
              if(_canVibrate)
                Vibrate.vibrate();
              if(!_isOn) {
                Lamp.turnOn();
                _isOn = true;
              } else {
                Lamp.turnOff();
                _isOn = false;
              }
            },
          )
        ],
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
                        if(_canVibrate)
                          Vibrate.vibrate();
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
            if(_canVibrate)
              Vibrate.vibrate();
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => AdicionarAlunoForm()
              )
            );
          }
      ),
    );
  }
}