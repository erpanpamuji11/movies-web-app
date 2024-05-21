import 'package:flutter/material.dart';
import 'package:movies_web_app/core/utils/responsive.dart';
import 'package:movies_web_app/modules/components/dashboard_widget.dart';
import 'package:movies_web_app/modules/components/side_menu_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer: !isDesktop ? const SizedBox(
              width: 250,
              child: SideMenuWidget(),
            )
          : null,
      body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            const Expanded(
              flex: 3,
              child: SideMenuWidget(),
            ),
          const Expanded(
            flex: 12,
            child: DashboardWidget(),
          )
        ],
      )),
    );
  }
}
