import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DigitalClockView extends StatefulWidget {

  final bool showDate; 
  const DigitalClockView({Key? key, this.showDate=false}) : super(key: key);

  @override
  State<DigitalClockView> createState() => _DigitalClockViewState(this.showDate);
}

class _DigitalClockViewState extends State<DigitalClockView> {

  final bool showDate;
  var now = DateTime.now();

  _DigitalClockViewState(bool this.showDate);

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) => setState(() {now = DateTime.now();}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return Column(
      children: [
        Text(
              formattedTime,
              style: TextStyle(color: Color(0xffeaecff), fontSize: 64),
            ),
            if(this.showDate)
              Text(
                formattedDate,
                style: TextStyle(color: Color(0xffeaecff), fontSize: 32),
              ),
      ],
    );
  }
}