enum Weekday {
  moday, tuesday, wednesday, thursday, friday, saturday, sunday
}

extension WeekdayUtil on Weekday {
  static List<Weekday> sortDays(List<Weekday> days) {
    List<Weekday> sortedDays = List.of([Weekday.moday, Weekday.tuesday, Weekday.wednesday, Weekday.thursday, Weekday.friday, Weekday.saturday, Weekday.sunday]);
    List<int> daysCount = List.filled(7, 0);

    for (var i in days) {
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