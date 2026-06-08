class Usuario {
  int? id;
  String nome;
  String email;
  String senha;

  Usuario(this.nome, this.email, this.senha);

  Usuario.fromMap(Map map)
    : id = map["id"],
      nome = map["nome"],
      email = map["email"],
      senha = map["senha"];

  Map<String, dynamic> toMap() {
    return {"id": id, "nome": nome, "email": email, "senha": senha};
  }
}
