import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_web_app/core/config/get_it_registry.dart';
import 'package:movies_web_app/core/utils/my_scroll.dart';
import 'package:movies_web_app/modules/main_screen.dart';
import 'package:movies_web_app/modules/stores/home/home_store.dart';
import 'package:provider/provider.dart';

void main() async {
  await getItRegister();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const MainScreen(),
      },
    ).call,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider(create: (_) => HomeStore()),
          ],
          child: MaterialApp.router(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerDelegate: routerDelegate,
            routeInformationParser: BeamerParser(),
          ),
        );
      },
    );
  }
}
