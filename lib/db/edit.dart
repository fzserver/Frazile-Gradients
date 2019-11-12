import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/db/DBManager.dart';
import 'package:frazilegradients/services/responses.dart';

class EditDB {
  // Insert Values in Gradients Table
  Future<int> saveGradients(GradientData gradients) async {
    print(Frazile.gradientTB);
    int result =
        await DBManager.db.insert(Frazile.gradientTB, gradients.toJson());
    return result;
  }

  // Update Values in Gradients Table
  Future<bool> updateGradient(GradientData gradient) async {
    var updateRow = await DBManager.db.update(
        Frazile.gradientTB, gradient.toJson(),
        where: 'id = ?', whereArgs: [gradient.id]);
    return updateRow > 0 ? true : false;
  }
}
