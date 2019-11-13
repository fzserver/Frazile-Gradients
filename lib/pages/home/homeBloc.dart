import 'package:frazilegradients/services/connectionStatus.dart';
import 'package:frazilegradients/services/manager.dart';
import 'package:frazilegradients/services/responses.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final gradientsBloc = BehaviorSubject<List<GradientData>>();
  List<GradientData> gradientsData = List<GradientData>();
  Observable<List<GradientData>> get gradients => gradientsBloc.stream;

  Future fetchGradients() async {
    try {
      ServiceManager sm = ServiceManager();
      List<GradientData> gradients = await sm.fetchGradients();
      gradientsBloc.sink.add(gradients);
    } catch (error) {
      print(error);
    }
  }

  dispose() {
    gradientsBloc.close();
  }
}
