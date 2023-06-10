import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/enum/page_type.dart';
import 'package:simple_clock/page/alarm_page.dart';
import 'package:simple_clock/page/clock_page.dart';
import 'package:simple_clock/page/timer-page.dart';
import 'package:simple_clock/provider/page_provider.dart';

import '../view/foot_row_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<PageProvider>(context).getPage().pageType ==
        PageType.alarm) {
      return const AlarmPage();
    } else if (Provider.of<PageProvider>(context).getPage().pageType ==
        PageType.timer) {
      return const TimerPage();
    }
    return const ClockPage();
  }
}
