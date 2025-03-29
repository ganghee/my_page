import 'package:flutter/widgets.dart';

enum RouterType {
  first,
  second,
}

class TravelRoutePainter extends CustomPainter {
  final Color color;
  final RouterType routerType;

  TravelRoutePainter({
    required this.color,
    required this.routerType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    if(routerType == RouterType.first) {
      canvas.drawPath(getFirstPath(screenSize: size), paint);
    }else {
      canvas.drawPath(getSecondPath(screenSize: size), paint);
    }
  }

  Path getFirstPath({required Size screenSize}) {
    final height = screenSize.height * 2.5;
    Path path = Path();
    path.moveTo(0, height);
    path.lineTo(0, 0);
    path.quadraticBezierTo(
      screenSize.width / 5,
      -screenSize.height / 2,
      screenSize.width,
      0,
    );
    path.lineTo(screenSize.width, height);

    path.close();
    return path;
  }

  Path getSecondPath({required Size screenSize}) {
    final height = screenSize.height * 2.5;

    Path path = Path();
    path.moveTo(0, height);
    path.lineTo(0, 0);
    path.quadraticBezierTo(
      screenSize.width / 1.2,
      -screenSize.height / 2,
      screenSize.width,
      0,
    );
    path.lineTo(screenSize.width, height);

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
