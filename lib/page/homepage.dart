import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/enum/page_type.dart';
import 'package:simple_clock/page/alarm_page.dart';
import 'package:simple_clock/page/clock_page.dart';
import 'package:simple_clock/provider/page_provider.dart';

import '../view/foot_row_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(Provider.of<PageProvider>(context).getPage().pageType == PageType.alarm)
          const AlarmPage(),
        if(Provider.of<PageProvider>(context).getPage().pageType != PageType.alarm)
          const ClockPage(),
        const Expanded(child: SizedBox(height: 10)),
        const Divider(
          color: Color(0xffeaecff),
          thickness: 1,
        ),
        const FootRow(),
      ],
    );
  }
}