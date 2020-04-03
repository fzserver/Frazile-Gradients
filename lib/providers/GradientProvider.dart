import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:frazilegradients/models/gradients.dart';
import 'package:frazilegradients/services/Gradientcaller.dart';
import 'package:frazilegradients/services/connectionStatus.dart';

class GradientProvider with ChangeNotifier {
  GradientResponse gradients;
  String errorMessage;
  bool loading = false;

  Future<void> fetchGradient() async {
    setLoading(true);
    notifyListeners();

    ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
    bool isOnline = await connectionStatus.checkConnection();

    await GradientCaller().fetchGradients().then((data) {
      if (data.statusCode == 200) {
        if (isOnline)
          setGradients(
            GradientResponse.fromJson(
              json.decode(
                data.body,
              ),
            ),
          );
        // set the loading to false
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
