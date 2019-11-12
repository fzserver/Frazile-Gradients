import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/db/DBManager.dart';

class DeleteDB {
  // Delete a gradient from gradients table
  Future<int> deleteGradient(int id) async =>
      DBManager.db.delete(Frazile.gradientTB, where: 'id = ?', whereArgs: [id]);
}
