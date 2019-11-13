import 'package:frazilegradients/constants/frazile.dart';

class CreateTable {
  // Gradients Table
  static const String gradients = '''CREATE TABLE IF NOT EXISTS ''' +
      Frazile.gradientTB +
      ''' (
    id int(100) PRIMARY KEY,
    name varchar(200) NOT NULL
    )
    ''';
}
