import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
  });

  final List<String> image;
  final String name;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100]!.withOpacity(.1),
          borderRadius: BorderRadius.circular(40.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 10.h),
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(image.isNotEmpty
                      ? "https://freestore.ezeestock.com/api/media/350x350/${image[0]}?background=transparent"
                      : "https://feb.kuleuven.be/drc/LEER/visiting-scholars-1/image-not-available.jpg/image"),
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                )),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130.w,
                  child: Text(
                    name,
                    style: AppTextStyle.title(),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "${price.substring(0, price.length - 4)} EGP",
                  style: AppTextStyle.title(),
                ),
                Text(
                  discount,
                  style: AppTextStyle.subTitle()
                      .copyWith(decoration: TextDecoration.lineThrough),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
