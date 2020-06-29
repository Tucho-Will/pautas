class Usuario {
  static final create_table = 'CREATE TABLE usuario ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'email TEXT NOT NULL ,'
      'nome TEXT NOT NULL ,'
      'senha TEXT NOT NULL)';

  int id;
  String email;
  String nome;
  String senha;

  Usuario({this.id, this.email, this.nome, this.senha});

  Usuario.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nome = json['nome'];
    senha = json['senha'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['senha'] = this.senha;
    return data;
  }
}
