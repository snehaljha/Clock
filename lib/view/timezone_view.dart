import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TimezoneView extends StatelessWidget {
  const TimezoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timezoneString = DateTime.now().timeZoneOffset.toString().split('.').first;
    if(!timezoneString.startsWith('-')) {
      timezoneString = '+' + timezoneString;
    }
    return Row(
      children: [
        Icon(
          Icons.language,
          color: Color(0xffeaecff),
        ),
        Text(
          'UTC' + timezoneString,
          style: TextStyle(color: Color(0xffeaecff), fontSize: 16),
        )
      ],
    );
  }
}