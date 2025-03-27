import 'package:flutter/widgets.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

bool isPortraitMode(BuildContext context) =>
    screenWidth(context) < screenHeight(context);
