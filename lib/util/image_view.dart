import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/widgets.dart';

Widget ImageView({
  required String imageUrl,
  Key? key,
  double? width,
  double? height,
  int? cacheHeight,
  BoxFit fit = BoxFit.cover,
  bool repeat = false,
  Color? color,
  BlendMode? colorBlendMode,
}) {
  if (kIsWeb && kDebugMode) {
    return Image.network(
      key: key,
      imageUrl,
      width: width,
      height: height,
      cacheHeight: cacheHeight ?? height?.toInt(),
      fit: fit,
      repeat: repeat ? ImageRepeat.repeat : ImageRepeat.noRepeat,
      color: color,
      colorBlendMode: colorBlendMode,
    );
  } else {
    return Image.asset(
      key: key,
      imageUrl,
      width: width,
      height: height,
      cacheHeight: cacheHeight ?? height?.toInt(),
      fit: fit,
      repeat: repeat ? ImageRepeat.repeat : ImageRepeat.noRepeat,
      color: color,
      colorBlendMode: colorBlendMode,
    );
  }
}
