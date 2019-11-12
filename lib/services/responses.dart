class GradientResponse {
  List<GradientData> gradients;

  GradientResponse({
    this.gradients,
  });

  factory GradientResponse.fromJson(Map<String, dynamic> json) {
    var gradientsList = json['gradients'] as List;
    List<GradientData> gradientList = gradientsList
        .map((gradient) => GradientData.fromJson(gradient))
        .toList();

    return GradientResponse(
      gradients: gradientList,
    );
  }
}

class GradientData {
  int id;
  String name;
  List<String> colors;
  List<double> stops;

  GradientData({
    this.id,
    this.name,
    this.colors,
    this.stops,
  });

  factory GradientData.fromJson(Map<String, dynamic> json) => GradientData(
        id: json['id'],
        name: json['name'],
        colors: List<String>.from(json['colors'].map((color) => color)),
        stops: List<double>.from(json['stops'].map((stop) => stop)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "colors": List<dynamic>.from(colors.map((color) => color)),
        "stops": List<dynamic>.from(stops.map((stop) => stop)),
      };
}
