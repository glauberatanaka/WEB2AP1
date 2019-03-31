import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';
import 'package:web2ap1_app/models/aluno.dart';
import 'package:web2ap1_app/service/firestoreService.dart';
 
class AdicionarAlunoForm extends StatefulWidget {
  AdicionarAlunoForm();
 
  @override
  State<StatefulWidget> createState() => new _AdicionarAlunoFormState();
}
 
class _AdicionarAlunoFormState extends State<AdicionarAlunoForm> {
  FirestoreService<Aluno> _alunosDb = new FirestoreService<Aluno>('alunos');
  final _formKey = GlobalKey<FormState>();
 
  TextEditingController _nomeController;
  TextEditingController _idadeController;
  TextEditingController _cursoController;
  TextEditingController _semestreController;

 
  @override
  void initState() {
    super.initState();
 
    _nomeController = new TextEditingController();
    _idadeController = new TextEditingController();
    _cursoController = new TextEditingController();
    _semestreController = new TextEditingController();

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aluno')),
      body: SingleChildScrollView(
          child: Container(
          margin: EdgeInsets.all(15.0),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Campo obrigatório.';
                  },
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                TextFormField(
                  controller: _idadeController,
                  decoration: InputDecoration(labelText: 'Idade'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Campo obrigatório.';
                  },
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                TextFormField(
                  controller: _cursoController,
                  decoration: InputDecoration(labelText: 'Curso'),
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Campo obrigatório.';
                  },
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                TextFormField(
                  controller: _semestreController,
                  decoration: InputDecoration(labelText: 'Semestre'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Campo obrigatório.';
                  },
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                RaisedButton(
                  child: Text('Adicionar'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _alunosDb.createObject(
                      new Aluno.fromValues(
                        _nomeController.text,
                        int.parse(_idadeController.text),
                        _cursoController.text,
                        int.parse(_semestreController.text)
                      )).then((_) {
                        print('aluno adicionado com sucesso');
                        Navigator.pop(context);
                    });
                    } else {
                      Vibrate.vibrate();
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );  
  }
}