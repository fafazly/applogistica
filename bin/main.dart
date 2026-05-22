import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/routes/users.dart';
import '../lib/routes/reciclometro.dart';
import '../lib/routes/reports.dart';

void main() async {
  final router = Router();

  // rotas
  router.mount('/users/', usersRouter());
  router.mount('/reciclometro/', reciclometroRouter());
  router.mount('/reports/', reportsRouter());

  // Middleware de log e CORS
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders()) // <-- ADICIONE ESTA LINHA AQUI
      .addHandler(router);

  
  var server = await io.serve(handler, '0.0.0.0', 8080);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}
