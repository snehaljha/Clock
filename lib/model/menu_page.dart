import 'package:simple_clock/enum/page_type.dart';

class MenuPage {
  PageType pageType;
  String title;
  String image;

  MenuPage._(this.pageType, this.title, this.image);

  
}

class MenuPageBuilder {
  
  static MenuPage? getPage(PageType type) {
    if(type == PageType.alarm) {
      return MenuPage._(type, 'Alarm', 'assets/alarm_icon.png');
    }
    if(type == PageType.timer) {
      return MenuPage._(type, 'Timer', 'assets/timer_icon.png');
    }
    if(type == PageType.clock) {
      return MenuPage._(type, 'Clock', 'assets/clock_icon.png');
    }
    if(type == PageType.stopwatch) {
      return MenuPage._(type, 'Stopwatch', 'assets/stopwatch_icon.png');
    }

    return null;
  }
}