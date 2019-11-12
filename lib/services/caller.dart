import 'package:dio/dio.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/services/responses.dart';

class ServiceCaller {
  final Dio _dio = Dio();

  Future<GradientResponse> fetchGradients() async {
    GradientResponse gradients;
    try {
      // var result = await _loadGradientAsset();
      String url = Frazile.baseURL + Frazile.gradientsURL;
      var result = await _dio.get(url);
      gradients = GradientResponse.fromJson(result.data);
      return gradients;
    } on DioError catch (error) {
      String er = Frazile().getErrorMessage(error);
      throw er;
    }
  }

  // Future<String> _loadGradientAsset() async {
  //   return await rootBundle.loadString('assets/data/gradients.json');
  // }
}
