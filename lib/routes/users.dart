import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import '../services/db_service.dart';
import '../models/user.dart';
import 'dart:convert';

Router usersRouter() {
  final router = Router();

  // POST /users/register -> Cadastro
  router.post('/register', (Request req) async {
    var body = await req.readAsString();
    var data = jsonDecode(body);

    final conn = await DBService.connect();
    await conn.query(
        'INSERT INTO users (nome, email, senha) VALUES (?, ?, ?)',
        [data['nome'], data['email'], data['senha']]
    );
    await conn.close();

    return Response.ok('Usuário cadastrado com sucesso!');
  });

  // POST /users/login -> Login
  router.post('/login', (Request req) async {
    var body = await req.readAsString();
    var data = jsonDecode(body);

    final conn = await DBService.connect();
    var results = await conn.query(
        'SELECT id, nome, email, senha FROM users WHERE email = ? AND senha = ?',
        [data['email'], data['senha']]
    );

    await conn.close();

    if (results.isNotEmpty) {
      var row = results.first;
      var user = User(
        id: row[0],
        nome: row[1],
        email: row[2],
        senha: row[3],
      );
      return Response.ok(jsonEncode(user.toJson()));
    } else {
      return Response.forbidden('Email ou senha inválidos');
    }
  });

  // DELETE /users/<id> -> Deletar perfil
  router.delete('/<id|[0-9]+>', (Request req, String id) async {
    final conn = await DBService.connect();
    await conn.query('DELETE FROM users WHERE id = ?', [int.parse(id)]);
    await conn.close();

    return Response.ok('Usuário deletado com sucesso!');
  });

  return router;
}

