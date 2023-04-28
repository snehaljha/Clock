import 'package:flutter/material.dart';
import 'package:simple_clock/view/clock_view.dart';
import 'package:simple_clock/view/digital_clock_view.dart';
import 'package:simple_clock/view/foot_row_view.dart';
import 'package:simple_clock/view/timezone_view.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Clock',
          style: TextStyle(color: Color(0xffeaecff), fontSize: 24),
        ),
        SizedBox(height: 32,),
        DigitalClockView(showDate: true),
        ClockView(),
        Text(
          'Timezone',
          style: TextStyle(color: Color(0xffeaecff), fontSize: 24),
        ),
        TimezoneView(),
        Expanded(child: SizedBox(height: 10)),
        Divider(
          color: Color(0xffeaecff),
          thickness: 1,
        ),
        FootRow(),
      ]
    );
  }
}