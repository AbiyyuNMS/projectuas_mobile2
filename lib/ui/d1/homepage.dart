// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prj_uas223_d1_24/controllers/product_provider.dart';
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';
import 'package:prj_uas223_d1_24/services/helper.dart';
import 'package:prj_uas223_d1_24/shared/home_widget.dart';

import 'package:prj_uas223_d1_24/shared/style_text.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();
    return Scaffold(
        backgroundColor: const Color(0xffEEF7FF),
        body: SizedBox(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.w, 45.h, 0, 0),
                height: 325.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/top_image.png"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.only(left: 8.w, bottom: 15.h),
                  width: 375.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sports Shoes",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        softWrap: false,
                        style:
                            styleappHg(30, Colors.white, FontWeight.bold, 1.2),
                      ),
                      Text(
                        "Collection",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        softWrap: false,
                        style:
                            styleappHg(30, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              styleapp(22, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: "Mens Shoes",
                            ),
                            Tab(
                              text: "Womens Shoes",
                            ),
                            Tab(
                              text: "Kids Shoes",
                            ),
                          ])
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 203.h),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 12.w,
                  ),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      male: productNotifier.male,
                      tabIndex: _tabController.index,
                    ),
                    HomeWidget(
                      male: productNotifier.female,
                      tabIndex: _tabController.index,
                    ),
                    HomeWidget(
                      male: productNotifier.kids,
                      tabIndex: _tabController.index,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
