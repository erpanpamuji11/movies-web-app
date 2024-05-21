import 'package:get_it/get_it.dart';
import 'package:movies_web_app/core/stores/screen_utils/screen_util_store.dart';
import 'package:movies_web_app/modules/stores/home/home_store.dart';


final getIt = GetIt.I;

Future getItRegister() async {
  getIt.registerSingleton<ScreenUtilStore>(ScreenUtilStore());
  getIt.registerSingleton<HomeStore>(HomeStore());
}
