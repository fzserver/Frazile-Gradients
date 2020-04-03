import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Frazile {
  //* Names
  static const String appName = 'Frazile Gradients';

  //* Service Caller Settings
  static const String baseURL =
      "https://storage.googleapis.com/frazilegradients";
  static const String gradientsURL = "/assets/data/gradients.json";

  //* DB Settings
  static const int dbversion = 1;
  static const String gradientTB = "Gradients";

  //* Error Messages
  String errorMessage;
  getErrorMessage(errorsData) {
    try {
      if (errorsData.response != null) {
        var responseData = json.decode(errorsData.response.toString());
        if (responseData['errors'] != null) {
          var errors = responseData['errors'];
          errors.forEach((k, v) => errorMessage = v[0].toString());
        } else {
          errorMessage = "Server error";
        }
      } else {
        errorMessage = "Server error";
      }
      return errorMessage;
    } catch (e) {
      return "Server error";
    }
  }

  //* SnackBars
  final snackBar = SnackBar(
    content: Text('No Internet Connection!'),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  //* Preferences
  static SharedPreferences prefs;
  static const String darkModePref = "darkModePref";

  //* Fonts
  static const String googleFamily = 'google';

  //* Loaders
  Widget gradientLoader() => SpinKitCubeGrid(
        size: 70.0,
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: FzColors().getLoaderColors(),
              tileMode: TileMode.clamp,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: FzColors().getLoaderStops(),
            ),
          ),
        ),
      );

  //* Sizes
  static const double appBarTitleSize = 20.0;
  static const double appBarLetterSpacing = 3.0;
  static const EdgeInsets gradientListTileTitlePadding = EdgeInsets.only(
    bottom: 10.0,
  );
  static const double gradientListTileTitleSize = 16.0;
  static const FontWeight gradientListTileFontWeight = FontWeight.w300;
  static const String gradientListTileFontFamily = 'google';
  static const double gradientListTileTitleLetterSpacing = 3.0;

  //* Routes
  static const String home = '/';
  static const String colorDetail = '/colorDetail';
}
