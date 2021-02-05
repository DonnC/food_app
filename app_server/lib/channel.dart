import 'package:app_server/models/index.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct/managed_auth.dart';

import 'app_server.dart';
import 'controllers/index.dart';
import 'server_config.dart';

class AppServerChannel extends ApplicationChannel {
  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = AppserverConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/products/[:id]").link(() => ProductController(context));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
