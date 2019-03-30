
import 'package:web2ap1_app/models/baseModel.dart';

class Aluno extends BaseModel{
  String _nome;
  int _idade;
  String _curso;
  int _semestre;

  Aluno();

  Aluno.fromValues(
    this._nome,
    this._idade,
    this._curso,
    this._semestre
  );

  Aluno.fromValuesWithId(
      String id,
      this._nome,
      this._idade,
      this._curso,
      this._semestre) {
    super.id = id;
  }

  String get nome => _nome;
  int get idade => _idade;
  String get curso => _curso;
  int get semestre => _semestre;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['nome'] = _nome;
    map['idade'] = _idade;
    map['curso'] = _curso;
    map['semestre'] = _semestre;
    return map;
  }

  Aluno.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this._nome = map['nome'];
    this._idade = map['idade'];
    this._curso = map['curso'];
    this._semestre = map['semestre'];
  }

  Aluno fromMap(Map<String, dynamic> map) {
    return Aluno.fromMap(map);
  }

  Aluno createNew() {
    return Aluno();
  }

}


























// import 'dart:convert';

// Aluno postFromJson(String str) {
//   final jsonData = json.decode(str);
//   return Aluno.fromJson(jsonData);
// }

// String alunoToJson(Aluno data) {
//   final dyn = data.toJson();
//   return json.encode(dyn);
// }


// List<Aluno> allAlunosFromJson(String str) {
//   final jsonData = json.decode(str);
//   var alunos = new List<Aluno>.from(jsonData.map((x) => Aluno.fromJson(x)));
//   print(alunos.length);
//   return alunos;
// }

// String allAlunosToJson(List<Aluno> data) {
//   final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
//   return json.encode(dyn);
// }

// class Aluno {
//   int alunoId;
//   String nome;
//   int idade;
//   String curso;
//   int semestre;

//   Aluno({
//     this.alunoId,
//     this.nome,
//     this.idade,
//     this.curso,
//     this.semestre
//   });

//   factory Aluno.fromJson(Map<String, dynamic> json) => new Aluno(
//     alunoId: json["alunoId"],
//     nome: json["nome"],
//     idade: json["idade"],
//     curso: json["curso"],
//     semestre: json["semestre"],
//   );

//   Map<String, dynamic> toJson() => {
//     "alunoId": alunoId,
//     "nome": nome,
//     "idade": idade,
//     "curso": curso,
//     "semestre": semestre,
//   };
// }