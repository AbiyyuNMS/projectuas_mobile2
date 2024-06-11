// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:prj_uas223_d1_24/controllers/mainpage_provider.dart';
import 'package:prj_uas223_d1_24/shared/bottomnav_widget.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageNotif>(builder: (context, mainPageNotif, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Color(
                0xff102C57,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavwdg(
                    onTap: () {
                      mainPageNotif.pageIndex = 0;
                    },
                    icon: mainPageNotif.pageIndex == 0
                        ? Icons.home
                        : Icons.home_outlined),
                BottomNavwdg(
                  onTap: () {
                    mainPageNotif.pageIndex = 1;
                  },
                  icon: mainPageNotif.pageIndex == 1
                      ? Ionicons.search
                      : Ionicons.search_outline,
                ),
                BottomNavwdg(
                  onTap: () {
                    mainPageNotif.pageIndex = 2;
                  },
                  icon: mainPageNotif.pageIndex == 2
                      ? Ionicons.heart
                      : Ionicons.heart_circle_outline,
                ),
                BottomNavwdg(
                  onTap: () {
                    mainPageNotif.pageIndex = 3;
                  },
                  icon: mainPageNotif.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline,
                ),
                BottomNavwdg(
                  onTap: () {
                    mainPageNotif.pageIndex = 4;
                  },
                  icon: mainPageNotif.pageIndex == 4
                      ? Ionicons.person
                      : Ionicons.person_add_outline,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
