import 'package:frazilegradients/constants/frazile.dart';
import 'package:rxdart/rxdart.dart';

class ConfigBloc {
  final configBloc = BehaviorSubject<bool>();
  Observable<bool> get darkMode => configBloc.stream;
  // Battery battery = Battery();

  // getBatteryLevel() async {
  //   int blevel = await battery.batteryLevel;
  //   BatteryState _batteryState;
  //   battery.onBatteryStateChanged.listen((BatteryState state) {
  //     _batteryState = state;
  //     (_batteryState == BatteryState.discharging || blevel <= 15)
  //         ? configBloc.sink.add(true)
  //         : configBloc.sink.add(false);
  //   });
  // }

  bool darkModeOn = Frazile.prefs.containsKey(Frazile.darkModePref)
      ? Frazile.prefs.getBool(Frazile.darkModePref)
      : false;

  checkDarkMode() {
    darkModeOn = Frazile.prefs.getBool(Frazile.darkModePref);
    configBloc.sink.add(darkModeOn);
  }

  changeDarkMode() {
    darkModeOn = Frazile.prefs.getBool(Frazile.darkModePref);
    darkModeOn
        ? Frazile.prefs.setBool(Frazile.darkModePref, false)
        : Frazile.prefs.setBool(Frazile.darkModePref, true);
    configBloc.sink.add(darkModeOn);
  }

  dispose() {
    configBloc.close();
  }
}
