import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prj_uas223_d1_24/controllers/cart_provider.dart';
import 'package:prj_uas223_d1_24/controllers/favorites_provider.dart';
import 'package:prj_uas223_d1_24/controllers/mainpage_provider.dart';
import 'package:prj_uas223_d1_24/controllers/product_provider.dart';
import 'package:prj_uas223_d1_24/ui/d1/mainpage.dart';
import 'package:provider/provider.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainPageNotif(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => FavoritesNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}
