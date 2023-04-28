import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/enum/weekday.dart';
import 'package:simple_clock/model/alarm.dart';
import 'package:simple_clock/provider/page_provider.dart';
import 'package:simple_clock/view/foot_row_view.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Provider.of<PageProvider>(context).getPage().title,
            style: const TextStyle(color: Color(0xffeaecff), fontSize: 24),
          ),
          const  SizedBox(height: 32,),
          Expanded(
            child: ListView(
              children: <Widget>[
                ...getAlarmCards(),
              ].followedBy([
                TextButton(
                  onPressed: (){},
                  child: DottedBorder(
                    color: Colors.white,
                    strokeWidth: 3.0,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(24.0),
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff444974),
                        borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/add_alarm.png"),
                          const Text(
                            'Add Alarm',
                            style: TextStyle(
                              color: Color(0xffeaecff),
                              fontSize: 14
                            ),
                            )
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          ),
          const Divider(
          color: Color(0xffeaecff),
          thickness: 1,
          ),
          const FootRow()
        ],
      ),
    );
  }


  List<Widget> getAlarmCards() {
    return [
      ...getAlarmCard(new Alarm("utho", true, List.of([Weekday.moday, Weekday.tuesday, Weekday.wednesday, Weekday.thursday, Weekday.friday]), DateTime(2023, 4, 29, 8, 0))),
      ...getAlarmCard(new Alarm("aaram se", false, List.of([Weekday.saturday, Weekday.sunday]), DateTime(2023, 4, 29, 10, 0)))
    ];
  }

  List<Widget> getAlarmCard(Alarm alarm) {
    return [
      DottedBorder(
        color: Colors.white,
        strokeWidth: 3.0,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24.0),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff444974),
            borderRadius: BorderRadius.circular(24.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.label, color: Color(0xffeaecff),),
                  SizedBox(width: 4,),
                  Text(
                    alarm.name,
                    style: TextStyle(color: Color(0xffeaecff), fontSize: 14),
                  ),
                  Expanded(child: SizedBox()),
                  Switch(value: alarm.enabled, onChanged: (newVal) {})
                ],
              ),
              Text(
                alarm.getShortWeekdays(),
                style: const TextStyle(
                  color: Color(0xffeaecff),
                  fontSize: 14.0
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  Text(
                    DateFormat('HH:mm').format(alarm.time),
                    style: const TextStyle(
                      color: Color(0xffeaecff),
                      fontSize: 32
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xffeaecff),
                    size: 32.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 16.0,
      )
    ];
  }
}