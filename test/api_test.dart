import 'package:flutter_test/flutter_test.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:dio/dio.dart';
import 'package:frazilegradients/services/responses.dart';

void main() {
  final Dio _dio = Dio();
  test(
    "Json Fetching => ",
    () async {
      final url = Frazile.baseURL + Frazile.gradientsURL;
      var result = await _dio.get(url);
      if (result.statusCode == 200) {
        final GradientResponse gradient =
            GradientResponse.fromJson(result.data);
        expect(gradient.gradients, isNotEmpty);
      }
    },
  );
}
