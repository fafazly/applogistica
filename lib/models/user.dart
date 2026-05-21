class User {
  final int id;
  final String nome;
  final String email;
  final String senha;

  User({required this.id,
    required this.nome,
    required this.email,
    required this.senha
    ,});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'email': email,
    'senha': senha,
  };
}
