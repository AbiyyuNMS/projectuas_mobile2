// import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:prj_uas223_d1_24/controllers/cart_provider.dart';
import 'package:prj_uas223_d1_24/controllers/favorites_provider.dart';
import 'package:prj_uas223_d1_24/controllers/product_provider.dart';
// import 'package:prj_uas223_d1_24/models/constant.dart';
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';
// import 'package:prj_uas223_d1_24/services/helper.dart';
import 'package:prj_uas223_d1_24/shared/checkout.dart';
import 'package:prj_uas223_d1_24/shared/mycolor.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';
import 'package:prj_uas223_d1_24/ui/d1/favorites.dart';
import 'package:provider/provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  // final _cartBox = Hive.box('cart_box');
  // final _favBox = Hive.box('fav_box');

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getShoes(widget.category, widget.id);
    var cartProvider = Provider.of<CartProvider>(context);
    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    return Scaffold(
      body: FutureBuilder<Welcome>(
          future: productNotifier.sneaker,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else {
              final sneaker = snapshot.data;
              return Consumer<ProductNotifier>(
                builder: (context, productNotifier, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  productNotifier.shoeSizes.clear();
                                },
                                child: const Icon(
                                  Ionicons.close,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: const Icon(
                                  Ionicons.ellipsis_horizontal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
                        expandedHeight: MediaQuery.of(context).size.height,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              SizedBox(
                                height: 401.h,
                                width: 375.w,
                                child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sneaker!.imageUrl.length,
                                    controller: pageController,
                                    onPageChanged: (page) {
                                      productNotifier.activePage = page;
                                    },
                                    itemBuilder: (context, int index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: 316.h,
                                            width: 375.w,
                                            color: Colors.grey.shade300,
                                            child: CachedNetworkImage(
                                              imageUrl: sneaker.imageUrl[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned(
                                              top: 98.h,
                                              right: 20.w,
                                              child:
                                                  Consumer<FavoritesNotifier>(
                                                builder: (context,
                                                    favoritesNotifier, child) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      if (favoritesNotifier.ids
                                                          .contains(
                                                              widget.id)) {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const FavoritesPage(),
                                                            ));
                                                      } else {
                                                        favoritesNotifier
                                                            .createFav({
                                                          "id": sneaker.id,
                                                          "name": sneaker.name,
                                                          "category":
                                                              sneaker.category,
                                                          "price":
                                                              sneaker.price,
                                                          "imageUrl": sneaker
                                                              .imageUrl[0],
                                                        });
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: favoritesNotifier.ids
                                                            .contains(
                                                                sneaker.id)
                                                        ? const Icon(
                                                            Ionicons.heart)
                                                        : const Icon(Ionicons
                                                            .heart_outline),
                                                  );
                                                },
                                              )),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List<Widget>.generate(
                                                    sneaker.imageUrl.length,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      4),
                                                          child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                productNotifier
                                                                            .activePage !=
                                                                        index
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        )),
                                              )),
                                        ],
                                      );
                                    }),
                              ),
                              Positioned(
                                  bottom: 30,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.645,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              sneaker.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.left,
                                              softWrap: false,
                                              style: styleapp(
                                                  27,
                                                  const Color(
                                                    0xff102C57,
                                                  ),
                                                  FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  sneaker.category,
                                                  style: styleapp(
                                                      20,
                                                      Colors.grey,
                                                      FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 4,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 22,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(horizontal: 1),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Ionicons.star,
                                                    size: 18,
                                                    color: Colors.black,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${sneaker.price}",
                                                  style: styleapp(
                                                      25,
                                                      Colors.black,
                                                      FontWeight.w700),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Colors",
                                                      style: styleapp(
                                                          18,
                                                          Colors.black,
                                                          FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          Colors.amberAccent,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Select Sizes",
                                                      style: styleapp(
                                                          20,
                                                          const Color(
                                                            0xff102C57,
                                                          ),
                                                          FontWeight.w700),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      "View Size Guide",
                                                      style: styleapp(
                                                          20,
                                                          Colors.grey,
                                                          FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  child: ListView.builder(
                                                    itemCount: productNotifier
                                                        .shoeSizes.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    padding: EdgeInsets.zero,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final sizes =
                                                          productNotifier
                                                              .shoeSizes[index];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: ChoiceChip(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60),
                                                          ),
                                                          // side: const BorderSide(
                                                          //     color:
                                                          //         Colors.black,
                                                          //     width: 1,
                                                          //     style: BorderStyle
                                                          //         .solid),
                                                          disabledColor:
                                                              Colors.white,
                                                          label: Text(
                                                            sizes['size'],
                                                            style: styleapp(
                                                                18,
                                                                sizes['isSelected']
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                FontWeight
                                                                    .w500),
                                                          ),
                                                          selectedColor:
                                                              BaseColors.color,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 8),
                                                          selected: sizes[
                                                              'isSelected'],
                                                          onSelected:
                                                              (newState) {
                                                            if (productNotifier
                                                                .sizes
                                                                .contains(sizes[
                                                                    'size'])) {
                                                              productNotifier
                                                                  .sizes
                                                                  .remove(sizes[
                                                                      'size']);
                                                            } else {
                                                              productNotifier
                                                                  .sizes
                                                                  .add(sizes[
                                                                      'size']);
                                                            }
                                                            print(
                                                                productNotifier
                                                                    .sizes);
                                                            productNotifier
                                                                .toggleCheck(
                                                                    index);
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider(
                                              indent: 10,
                                              endIndent: 10,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Text(
                                                sneaker.title,
                                                style: styleapp(
                                                    20,
                                                    BaseColors.color,
                                                    FontWeight.w700),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              sneaker.description,
                                              maxLines: 4,
                                              textAlign: TextAlign.justify,
                                              style: styleapp(
                                                  14,
                                                  BaseColors.color,
                                                  FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: CheckoutButton(
                                                  onTap: () async {
                                                    cartProvider.createCart({
                                                      "id": sneaker.id,
                                                      "name": sneaker.name,
                                                      "category":
                                                          sneaker.category,
                                                      "sizes": productNotifier
                                                          .sizes[0],
                                                      "imageUrl":
                                                          sneaker.imageUrl[0],
                                                      "price": sneaker.price,
                                                      "qty": 1
                                                    });
                                                    productNotifier.sizes
                                                        .clear();
                                                    Navigator.pop(context);
                                                  },
                                                  label: "Add To Cart",
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
