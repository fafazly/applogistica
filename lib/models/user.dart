class User {
  final int id;
  final String nome;
  final String email;

  User({required this.id, required this.nome, required this.email});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'email': email,
  };
}
