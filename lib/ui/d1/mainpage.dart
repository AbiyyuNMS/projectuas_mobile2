import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/controllers/mainpage_provider.dart';
import 'package:prj_uas223_d1_24/shared/bottom_navbar.dart';
import 'package:prj_uas223_d1_24/ui/d1/cartpage.dart';
import 'package:prj_uas223_d1_24/ui/d1/favorites.dart';
import 'package:prj_uas223_d1_24/ui/d1/homepage.dart';
import 'package:prj_uas223_d1_24/ui/d1/productby_cart.dart';
import 'package:prj_uas223_d1_24/ui/d1/profilepage.dart';
import 'package:prj_uas223_d1_24/ui/d1/searchpage.dart';
import 'package:provider/provider.dart';
// import 'package:prj_uas223_d1_24/ui/d1/style/style_text.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  List<Widget> pagelist = [
    const MyHomePage(),
    const MySearchPage(),
    const FavoritesPage(),
    MyCartPage(),
    // const MyProfilePage()
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageNotif>(builder: (context, mainPageNotif, child) {
      return Scaffold(
        backgroundColor: const Color(0xffEEF7FF),
        body: pagelist[mainPageNotif.pageIndex],
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
