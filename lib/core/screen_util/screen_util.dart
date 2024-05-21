

import 'package:movies_web_app/core/screen_util/screen_util_function.dart';
import 'package:movies_web_app/core/screen_util/screen_util_widget.dart';

class ScreenUtils with ScreenUtilFunction, ScreenUtilWidget {
  static final ScreenUtils _singleton = ScreenUtils._internal();
  ScreenUtils._internal();
  factory ScreenUtils() => _singleton;
}
