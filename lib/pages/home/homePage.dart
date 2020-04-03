import 'package:flutter/material.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/pages/home/homeBody.dart';
import 'package:frazilegradients/providers/GradientProvider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientProvider = Provider.of<GradientProvider>(context);
    gradientProvider.fetchGradient();
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
            colors: FzColors()
                .getColors(gradientProvider.getGradients().gradients)),
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
            onPressed: () => Share.share(
                "Download Frazile Gradients & share with your tech friends.\nPlayStore -  "),
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: gradientProvider.loading
          ? Center(child: Frazile().gradientLoader())
          : HomeBody(gradientProvider.getGradients().gradients),
    );
  }
}
