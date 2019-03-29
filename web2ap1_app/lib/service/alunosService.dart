import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:web2ap1_app/models/aluno.dart';

String url = 'http://localhost:5000/api/Alunos';



Future<List<Aluno>> getAllAlunos() async {
  var response = await http.get(new Uri.http('192.168.137.251:5000', '/api/Alunos'));
  print(response.body);
  return allAlunosFromJson(response.body);
}

Future<List<Aluno>> obterTodosAlunos() async {
  var data = await http.get(url);
  var jsonData = json.decode(data.body);
  List<Aluno> alunos = [];
  for(var a in jsonData) {
    Aluno aluno = new Aluno(
      alunoId: a["alunoId"],
      nome: a["nome"],
      idade: a["idade"],
      curso: a["curso"],
      semestre: a["semestre"],
    );
    alunos.add(aluno);
  }
  print(alunos.length);
  return alunos;
}

Future<Aluno> getAluno(int id) async{
  final response = await http.get('$url/$id');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Aluno aluno) async{
  final response = await http.post('$url', body: alunoToJson(aluno));
  return response;
}
