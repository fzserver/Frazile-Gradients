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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: Frazile.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Frazile.googleFamily,
          primarySwatch: Colors.red,
          primaryColor: FzColors.appColor,
          canvasColor: FzColors.canvasColor,
          primaryIconTheme: IconThemeData(
            color: FzColors.iconColor,
          ),
          disabledColor: Colors.grey,
          primaryTextTheme: Theme.of(context).textTheme.apply(
                bodyColor: FzColors.textColor,
                displayColor: FzColors.textColor,
              ),
          brightness: Brightness.light,
        ),
        home: HomePage(),
        routes: {
          Frazile.colorDetail: (BuildContext context) => ColorDetail(),
        },
      );
}
