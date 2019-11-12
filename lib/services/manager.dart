import 'package:frazilegradients/db/DBManager.dart';
import 'package:frazilegradients/db/edit.dart';
import 'package:frazilegradients/db/read.dart';
import 'package:frazilegradients/services/caller.dart';
import 'package:frazilegradients/services/connectionStatus.dart';
import 'package:frazilegradients/services/responses.dart';

class ServiceManager {
  final DBManager db = DBManager();
  final EditDB editDB = EditDB();
  final ReadDB readDB = ReadDB();
  final ServiceCaller _sc = ServiceCaller();

  Future<List<GradientData>> fetchGradients() async {
    GradientResponse gradients;
    try {
      ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
      bool isOnline = await connectionStatus.checkConnection();
      if (isOnline) gradients = await _sc.fetchGradients();
      // if (gradients.gradients != null && gradients.gradients.length > 0)
      // print(gradients.gradients.length);
      // await Future.forEach(gradients.gradients, (gradient) async {
      //   print(gradient.toString());
      //   await db.saveGradients(gradient);
      // });
      return gradients.gradients;
      // return await _readDB.getGradients();
    } catch (e) {
      throw e;
    }
  }
}
