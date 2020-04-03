import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frazilegradients/models/gradients.dart';
import 'package:frazilegradients/services/Gradientcaller.dart';

class GradientProvider with ChangeNotifier {
  GradientResponse gradients;
  String errorMessage;
  bool loading = false;

  Future<void> fetchGradient() async {
    setLoading(true);
    notifyListeners();

    await GradientCaller().fetchGradients().then((data) {
      if (data.statusCode == 200) {
        setGradients(GradientResponse.fromJson(json.decode(data.body)));
        setLoading(false);
        notifyListeners();
      } else {
        // Map<String, dynamic> result = json.decode(data.body);
        setMessage('Data Not Fetched!');
      }
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  // It is checking whether data is fetched from the server or not yet.
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
