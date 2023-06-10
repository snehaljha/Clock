import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:simple_clock/view/foot_row_view.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _curState = 0;
  int _minute = 0;
  int _second = 0;
  @override
  Widget build(BuildContext context) {
    const playIcon = Icon(Icons.play_circle_fill_rounded, size: 60, color: Color(0xffA5D7E8),);
    var pauseIcon = Container(
        // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: const Icon(Icons.pause_circle_filled, size: 60, color: Color(0xffA5D7E8),)
    );
    return Column(
      children: [
        Row(
          children: [
          NumberPicker(
              minValue: 0,
              maxValue:60,
              value: _minute,
              onChanged: (val) {
                setState(() {
                  _minute = val;
                });
              }
          ),
            NumberPicker(
                minValue: 0,
                maxValue:60,
                value: _second,
                onChanged: (val) {
                  setState(() {
                    _second = val;
                  });
                }
            )
        ]),
        // timer painter,
        const Expanded(
            child: SizedBox(
          height: 10.0,
        )),
        Container(
          height: 100.0,
          color: Colors.amber,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // textBaseline: TextBaseline.ideographic,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if(_curState == 0) {
                          // validation and start
                          _curState = 1;
                          return;
                        }

                        // pauseHandler();
                        // subtract remaining with timer
                      });
                    },
                    icon: _curState == 0 ? playIcon : pauseIcon),
                if (_curState == 1) ...[
                  Column(

                    children: [
                      Expanded(child: SizedBox(height: 5.0,)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _minute = 0;
                              _second = 0;
                              _curState = 0;
                              // remove timer instance
                            });

                          },
                          icon: const Icon(Icons.restart_alt_rounded, size: 30.0, color: Color(0xffA5D7E8),)),
                    ],
                  )
                ],
              ]),
        ),
        const FootRow()
      ],
    );
  }
}
