import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({ Key? key }) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = min(300.0, min(MediaQuery.of(context).size.width*0.75, MediaQuery.of(context).size.height*0.75));
    return Container(
      alignment: Alignment.center,
      height: size,
      child: Transform.rotate(
        angle: 0,
        child: CustomPaint(
          willChange: true,
          size: Size(size, size),
        painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {

  var datetime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width/2;
    var centerY = size.height/2;

    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // for clock bg circle
    drawCircle(canvas, center, radius-40, const Color(0xff444974), 1.0, PaintingStyle.fill);

    // for clock boundary
    drawCircle(canvas, center, radius-40, const Color(0xffeaecff), 16.0, PaintingStyle.stroke);


    // for second hand
    drawHand(canvas, center, radius, getEndPointForSecond(center, radius), const RadialGradient(
      colors: [Colors.orange, Colors.amber, Colors.white])
      .createShader(Rect.fromCircle(center: center, radius: radius)),
      8.0);

    // for minute hand
    drawHand(canvas, center, radius, getEndPointForMinute(center, radius), const RadialGradient(
      colors: [Colors.blue, Colors.lightBlue, Colors.white])
      .createShader(Rect.fromCircle(center: center, radius: radius)),
      12.0);

    // for hour hand
    drawHand(canvas, center, radius, getEndPointForHour(center, radius), const RadialGradient(
      colors: [Colors.pink, Colors.purple, Colors.deepPurple])
      .createShader(Rect.fromCircle(center: center, radius: radius)),
      16.0);
    
    // for clock center dot
    drawCircle(canvas, center, 16.0, const Color(0xffeaecff), 1.0, PaintingStyle.fill);
  }

  Offset getEndPointForSecond(center, radius) {
    return getEndPointForHands(datetime.second*6, center, radius-60);
  }

  Offset getEndPointForMinute(center, radius) {
    return getEndPointForHands(datetime.minute*6, center, radius-70);
  }

  Offset getEndPointForHour(center, radius) {
    var val = datetime.hour;
    if(val > 11) {
      val -= 12;
    }
    return getEndPointForHands(val*30 + datetime.minute * 0.5, center, radius-80);
    // return getEndPointForHands(180, center, radius);
  }

  Offset getEndPointForHands(deg, Offset center, radius) {
    var x = center.dx + radius * sin(deg*pi/180);
    var y = center.dy - radius * cos(deg*pi/180);

    return Offset(x, y);
  }

  void drawHand(Canvas canvas, Offset center, radius, endPoint, gradientShader, strokeWidth) {
    var handBrush = Paint()
    ..shader = gradientShader
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = strokeWidth;

    canvas.drawLine(center, endPoint, handBrush);
  }

  void drawCircle(Canvas canvas, Offset center, radius, color, strokeWidth, PaintingStyle style) {
    var brush = Paint()
    ..color = color
    ..strokeWidth = strokeWidth
    ..style = style;

    canvas.drawCircle(center, radius, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}