import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/db/DBManager.dart';
import 'package:frazilegradients/models/gradients.dart';

class EditDB {
  // // Insert Values in Gradients Table
  Future<int> saveGradients(GradientData gradients) async {
    int result =
        await DBManager.db.insert(Frazile.gradientTB, gradients.toJson());
    return result;
  }

  // // Update Values in Gradients Table
  Future<bool> updateGradient(GradientData gradient) async {
    var updateRow = await DBManager.db.update(
        Frazile.gradientTB, gradient.toJson(),
        where: 'id = ?', whereArgs: [gradient.id]);
    return updateRow > 0 ? true : false;
  }

  // Future<bool> upsertGradients(GradientData gradient) async {
  //   // var row =
  //   //     await DBManager.db.rawQuery('SELECT * FROM Gradients WHERE id = 74');
  //   // print('Query => ' + row.toString());
  //   // if (row != null && row.length > 0) {
  //   // var updateRow = await DBManager.db.update(
  //   //     Frazile.gradientTB, gradient.toJson(),
  //   //     where: 'id = ?', whereArgs: [gradient.id]);
  //   // return updateRow > 0 ? true : false;
  //   // } else {
  //   int result =
  //       await DBManager.db.insert(Frazile.gradientTB, gradient.toJson());
  //   return result > 0 ? true : false;
  //   // }
  // }
}
