import 'package:flutter/material.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/pages/config/configBloc.dart';
import 'package:frazilegradients/pages/home/homeBody.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.fetchGradients();
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: homeBloc.gradients,
      builder: (context, AsyncSnapshot<List<GradientData>> snapshot) {
        if (snapshot.hasData)
          return Scaffold(
            appBar: GradientAppBar(
              gradient:
                  LinearGradient(colors: FzColors().getColors(snapshot.data)),
              centerTitle: true,
              title: Text(
                Frazile.appName,
                style: TextStyle(
                  fontSize: Frazile.appBarTitleSize,
                  letterSpacing: Frazile.appBarLetterSpacing,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    ConfigBloc().changeDarkMode();
                    print('Dark = ' + ConfigBloc().darkModeOn.toString());
                  },
                  icon: Icon(Icons.lightbulb_outline),
                ),
                IconButton(
                  onPressed: () => Share.share(
                      "Download Frazile Gradients & share with your tech friends.\nPlayStore -  "),
                  icon: Icon(Icons.share),
                ),
              ],
            ),
            body: HomeBody(snapshot.data),
          );

        if (snapshot.connectionState != ConnectionState.done)
          return Center(
            child: Frazile().gradientLoader(),
          );

        return Scaffold(
          body: Container(
            color: Colors.white,
          ),
        );
      });
}
