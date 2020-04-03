import 'package:flutter/material.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/pages/color/colorDetail.dart';
import 'package:frazilegradients/pages/home/homePage.dart';
import 'package:frazilegradients/providers/GradientProvider.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<GradientProvider>(
        create: (context) => GradientProvider(),
        child: MaterialApp(
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
          initialRoute: Frazile.home,
          routes: {
            Frazile.home: (BuildContext context) => HomePage(),
            Frazile.colorDetail: (BuildContext context) => ColorDetail(),
          },
        ),
      );
}
