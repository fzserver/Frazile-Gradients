import 'package:flutter/material.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/pages/color/colorDetail.dart';
import 'package:frazilegradients/pages/config/configBloc.dart';
import 'package:frazilegradients/pages/home/homePage.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc = ConfigBloc();

  @override
  void initState() {
    configBloc.checkDarkMode();
    super.initState();
  }

  @override
  void dispose() {
    configBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: configBloc.darkMode,
        builder: (context, snapshot) {
          bool dark = snapshot.data == null ? false : snapshot.data;
          return MaterialApp(
            title: Frazile.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Frazile.googleFamily,
              primarySwatch: Colors.red,
              primaryColor: dark ? FzColors.darkAppColor : FzColors.appColor,
              canvasColor:
                  dark ? FzColors.darkCanvasColor : FzColors.canvasColor,
              primaryIconTheme: IconThemeData(
                color: FzColors.iconColor,
              ),
              disabledColor: Colors.grey,
              primaryTextTheme: Theme.of(context).textTheme.apply(
                    bodyColor: FzColors.textColor,
                    displayColor: FzColors.textColor,
                  ),
              brightness: dark ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
            routes: {
              Frazile.colorDetail: (BuildContext context) => ColorDetail(),
            },
          );
        },
      );
}
