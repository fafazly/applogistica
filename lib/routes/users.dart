import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/db_service.dart';
import '../models/user.dart';

Router usersRouter() {
  final router = Router();

  // GET /users
  router.get('/', (req) async {
    final conn = await DBService.connect();
    var results = await conn.query('SELECT id, nome, email FROM users');
    var users = results.map((row) => User(
      id: row[0],
      nome: row[1],
      email: row[2],
    ).toJson()).toList();
    await conn.close();
    return Response.ok(users.toString());
  });

  return router;
}
