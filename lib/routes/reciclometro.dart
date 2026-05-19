import 'package:shelf_router/shelf_router.dart';
import '../services/db_service.dart';
import '../models/reciclavel.dart';
import 'package:shelf/shelf.dart';

Router reciclometroRouter() {
  final router = Router();

  // GET /reciclometro
  router.get('/', (Request req) async {
    final conn = await DBService.connect();
    var results = await conn.query('SELECT id, tipo, quantidade, unidade, usuario_id FROM reciclaveis');
    var reciclaveis = results.map((row) => Reciclavel(
      id: row[0],
      tipo: row[1],
      quantidade: row[2],
      unidade: row[3],
      usuarioId: row[4],
    ).toJson()).toList();
    await conn.close();
    return Response.ok(reciclaveis.toString());
  });

  // POST /reciclometro
  router.post('/', (Request req) async {
    var body = await req.readAsString();
    // Aqui você faria o parse do JSON recebido
    // Exemplo simplificado:
    final conn = await DBService.connect();
    await conn.query(
      'INSERT INTO reciclaveis (tipo, quantidade, unidade, usuario_id) VALUES (?, ?, ?, ?)',
      ['plástico', 10.5, 'kg', 1],
    );
    await conn.close();
    return Response.ok('Material reciclável cadastrado com sucesso!');
  });

  return router;
}
