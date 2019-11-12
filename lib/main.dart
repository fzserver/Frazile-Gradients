import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frazilegradients/db/DBManager.dart';
import 'package:frazilegradients/pages/config/configPage.dart';
import 'package:frazilegradients/services/connectionStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/frazile.dart';

Future<void> main() async {
  ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
  connectionStatus.initialize();
  initilizeLocalDB();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // * Get Shared Preference Instance for whole app
  Frazile.prefs = await SharedPreferences.getInstance();

  runApp(ConfigPage());
}

initilizeLocalDB() async {
  DBManager db = DBManager.internal();
  await db.initDb();
}
