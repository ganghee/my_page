import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum RouterType {
  first,
  second,
}

class TravelRoutePainter extends CustomPainter {
  final Color color;
  final RouterType routerType;
  ui.Image? image;

  TravelRoutePainter({
    required this.color,
    required this.routerType,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    Paint paint = Paint()
      ..color = routerType == RouterType.first ? color : color
      ..imageFilter = ui.ImageFilter.blur(
        sigmaX: 0.5,
        sigmaY: 0.5,
      )
      ..style = PaintingStyle.fill;
    if (routerType == RouterType.first) {
      canvas.drawPath(_getFirstPath(screenSize: size), paint);
    } else {
    image = await loadUiImage('assets/images/gangneung/gangneung_pattern.webp');
      final src =
          Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble());
      final dst = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawImageRect(image!, src, dst, paint);
      canvas.drawPath(_getSecondPath(screenSize: size), paint);
    }
  }

  Path _getFirstPath({required Size screenSize}) {
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

  Path _getSecondPath({required Size screenSize}) {
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

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }
}
