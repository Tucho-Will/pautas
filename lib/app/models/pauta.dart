import 'package:app/app/models/user.dart';

class Pauta {
  static final create_table = 'CREATE TABLE pauta ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
      'titulo TEXT NOT NULL , '
      'descricao TEXT NOT NULL , '
      'detalhe TEXT NOT NULL , '
      'autor_id INTEGER NOT NULL,'
      'status INTEGER NOT NULL,'
      'FOREIGN KEY (autor_id) REFERENCES usuario (id) '
      'ON DELETE NO ACTION ON UPDATE NO ACTION)';

  int id;
  String titulo;
  String descricao;
  String detalhe;
  int status;
  int autor_id;
  Usuario autor;

  Pauta(
      {this.id,
      this.titulo,
      this.descricao,
      this.detalhe,
      this.autor_id,
      this.status});

  Pauta.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    detalhe = map['detalhe'];
    autor_id = map['autor_id'];
    status = map['status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['detalhe'] = this.detalhe;
    data['autor_id'] = this.autor_id;
    data['status'] = this.status;
    return data;
  }
}
