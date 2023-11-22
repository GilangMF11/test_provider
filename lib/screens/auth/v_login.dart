import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider_dzikir/utils/util_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double get screenheight => MediaQuery.of(context).size.height;
  double get screenwidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(),
                child: Container(
                  height: screenheight / 1.3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();
    canvas.drawPath(p, Paint()..color = ColorUtils.primaryColor());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
