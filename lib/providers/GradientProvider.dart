import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frazilegradients/models/gradients.dart';
import 'package:frazilegradients/services/Gradientcaller.dart';

class GradientProvider with ChangeNotifier {
  GradientResponse gradients;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchGradient() async {
    setLoading(true);

    await GradientCaller().fetchGradients().then((data) {
      if (data.statusCode == 200) {
        setGradients(GradientResponse.fromJson(json.decode(data.body)));
      } else {
        // Map<String, dynamic> result = json.decode(data.body);
        setMessage('Data Not Fetched!');
      }
    });
    return true;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() => loading;

  void setGradients(value) {
    gradients = value;
    notifyListeners();
  }

  GradientResponse getGradients() => gradients;

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() => errorMessage;
}
