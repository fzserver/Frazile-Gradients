import 'package:frazilegradients/constants/frazile.dart';
import 'package:http/http.dart' as http;

class GradientCaller {
  GradientCaller();
  Future<http.Response> fetchGradients() =>
      http.get(Frazile.baseURL + Frazile.gradientsURL);
}
