class Reciclavel {
  final int id;
  final String tipo;       // plástico, vidro, papel, metal
  final double quantidade; // ex: 10.5
  final String unidade;    // kg, toneladas
  final int usuarioId;

  Reciclavel({
    required this.id,
    required this.tipo,
    required this.quantidade,
    required this.unidade,
    required this.usuarioId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'tipo': tipo,
    'quantidade': quantidade,
    'unidade': unidade,
    'usuarioId': usuarioId,
  };
}
