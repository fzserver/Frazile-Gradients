import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:frazilegradients/db/edit.dart';
import 'package:frazilegradients/db/read.dart';
import 'package:frazilegradients/models/gradients.dart';
import 'package:frazilegradients/services/Gradientcaller.dart';
import 'package:frazilegradients/services/connectionStatus.dart';

class GradientProvider with ChangeNotifier {
  List<GradientData> gradients;
  String errorMessage;
  bool loading = false;
  final EditDB editDB = EditDB();
  final ReadDB readDB = ReadDB();

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

  void setGradients(GradientResponse value) async {
    // int totalgradients = value.gradients.length;
    // for (int i = 0; i <= totalgradients; i++) {
    //   await editDB.saveGradients(value.gradients[i]);
    // }
    gradients = value.gradients;
    // gradients = await readDB.getGradients();
    notifyListeners();
  }

  List<GradientData> getGradients() => gradients;

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() => errorMessage;
}
