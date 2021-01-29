import 'package:app_server/app_server.dart';

class AppserverConfig extends Configuration {
  AppserverConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}