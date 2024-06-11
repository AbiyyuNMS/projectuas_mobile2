import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';
import 'package:prj_uas223_d1_24/shared/stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Welcome>> male,
  }) : _male = male;

  final Future<List<Welcome>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Welcome>>(
        future: _male,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final male = snapshot.data;
            return StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 15.h,
              itemCount: male!.length,
              scrollDirection: Axis.vertical,
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3) ? 285.h : 252.h),
              itemBuilder: (BuildContext context, int index) {
                final shoe = snapshot.data![index];
                return StaggerTile(
                    imageUrl: shoe.imageUrl[1],
                    name: shoe.name,
                    price: "\$${shoe.price}");
              },
            );
          }
        });
  }
}
