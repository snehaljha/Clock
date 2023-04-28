import 'package:simple_clock/enum/weekday.dart';

class Alarm {
  String name;
  bool enabled;
  List<Weekday>? weekdays;
  DateTime time;

  Alarm(this.name, this.enabled, this.weekdays, this.time);

  String getShortWeekdays() {
    if(weekdays == null) {
      return '';
    }
    return _sortDays().map((e) => e.name.substring(0, 3)).join(",");
  }

  List<Weekday> _sortDays() {
    List<Weekday> sortedDays = List.of([Weekday.moday, Weekday.tuesday, Weekday.wednesday, Weekday.thursday, Weekday.friday, Weekday.saturday, Weekday.sunday]);
    List<int> daysCount = List.filled(7, 0);

    for (var i in weekdays!) {
      daysCount[sortedDays.indexOf(i)]++;
    }

    List<Weekday> res = [];
    for(int i=0; i<7; i++) {
      for(int j=0; j<daysCount[i]; j++) {
        res.add(sortedDays[i]);
      }
    }

    return res;
  }
}