import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/db/DBManager.dart';
import 'package:frazilegradients/models/gradients.dart';

class ReadDB {
  // Select Gradients from DB
  Future<List<GradientData>> getGradients() async {
    var rows = await DBManager.db.query(Frazile.gradientTB);
    if (rows != null && rows.length > 0)
      return rows.isNotEmpty
          ? rows.map((gradient) => GradientData.fromJson(gradient)).toList()
          : [];
    return [];
  }
}
