import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:prj_uas223_d1_24/controllers/product_provider.dart';
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';
import 'package:prj_uas223_d1_24/shared/new_shoes.dart';
import 'package:prj_uas223_d1_24/shared/product_card.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';
import 'package:prj_uas223_d1_24/ui/d1/product_page.dart';
import 'package:prj_uas223_d1_24/ui/d1/productby_cart.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Welcome>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Welcome>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
          height: 325.h,
          child: FutureBuilder<List<Welcome>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final shoe = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          productNotifier.shoeSizes = shoe.sizes;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                      id: shoe.id, category: shoe.category)));
                        },
                        child: ProductCard(
                          price: "\$${shoe.price}",
                          category: shoe.category,
                          id: shoe.category,
                          name: shoe.name,
                          image: shoe.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              }),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest shoes",
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                    softWrap: false,
                    style: styleapp(22, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: styleapp(20, Colors.black, FontWeight.w400),
                        ),
                        Icon(
                          Ionicons.caret_forward,
                          size: 20.h,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 99.h,
          child: FutureBuilder<List<Welcome>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: NewShoes(
                            onTap: () {
                              productNotifier.shoeSizes = shoe.sizes;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        id: shoe.id, category: shoe.category),
                                  ));
                            },
                            imageUrl: shoe.imageUrl[1]),
                      );
                    },
                  );
                }
              }),
        ),
      ],
    );
  }
}
