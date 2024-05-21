import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_web_app/core/const/constant.dart';
import 'package:movies_web_app/core/data/side_menu_data.dart';
import 'package:movies_web_app/core/screen_util/screen_util.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;
  final data = SideMenuData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: const Color(0xFF171821),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Movies",
                style: ScreenUtils().textStyleHeadline(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "24",
                style: ScreenUtils().textStyleHeadline(context).copyWith(
                  color: Colors.redAccent
                ),
              ),
            ],
          ),
          Gap(20.h),
          Expanded(
            child: ListView.builder(
              itemCount: data.menu.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Icon(
                    data.menu[index].icon,
                    color: isSelected ? selectionColor : Colors.grey,
                  ),
                ),
                Text(
                  data.menu[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? selectionColor : Colors.grey,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
            isSelected
                ? Container(
                    width: 1.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                        color: isSelected ? selectionColor : Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
