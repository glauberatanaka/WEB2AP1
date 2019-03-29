import 'dart:convert';

Aluno postFromJson(String str) {
  final jsonData = json.decode(str);
  return Aluno.fromJson(jsonData);
}

String alunoToJson(Aluno data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Aluno> allAlunosFromJson(String str) {
  final jsonData = json.decode(str);
  var alunos = new List<Aluno>.from(jsonData.map((x) => Aluno.fromJson(x)));
  print(alunos.length);
  return alunos;
}

String allAlunosToJson(List<Aluno> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Aluno {
  int alunoId;
  String nome;
  int idade;
  String curso;
  int semestre;

  // Aluno({
  //   this.alunoId,
  //   this.nome,
  //   this.idade,
  //   this.curso,
  //   this.semestre
  // });

  Aluno({
    this.alunoId,
    this.nome,
    this.idade,
    this.curso,
    this.semestre
  });

  factory Aluno.fromJson(Map<String, dynamic> json) => new Aluno(
    alunoId: json["alunoId"],
    nome: json["nome"],
    idade: json["idade"],
    curso: json["curso"],
    semestre: json["semestre"],
  );

  Map<String, dynamic> toJson() => {
    "alunoId": alunoId,
    "nome": nome,
    "idade": idade,
    "curso": curso,
    "semestre": semestre,
  };
}