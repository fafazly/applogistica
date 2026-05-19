import 'package:shelf_router/shelf_router.dart';
import '../services/db_service.dart';
import 'package:shelf/shelf.dart';

Router reportsRouter() {
  final router = Router();

  // GET /reports
  router.get('/', (Request req) async {
    final conn = await DBService.connect();
    var results = await conn.query(
        'SELECT tipo, SUM(quantidade) as total FROM reciclaveis GROUP BY tipo'
    );

    var report = results.map((row) => {
      'tipo': row[0],
      'total': row[1],
    }).toList();

    await conn.close();
    return Response.ok(report.toString());
  });

  return router;
}
