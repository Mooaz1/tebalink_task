import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tebalink_task/core/app_routes/app_routes_name.dart';
import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/core/text_style.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/presentation/cubits/products/products_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.read<ProductsCubit>();
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: AppTextStyle.appBarText(),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () async {
                    await CacheHelper.removeData(
                        key: AppConstant.userAccessToken);

                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRoutesName.splashScreen, (route) => false);
                    }
                  },
                  icon: const Icon(Icons.logout_outlined))
            ],
          ),
          body: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              final result = snapshot.data;
              if (result != ConnectivityResult.none) {
                return BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return productsCubit.products.isNotEmpty
                        ? NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification sn) {
                              if (!productsCubit.loading &&
                                  sn is ScrollUpdateNotification &&
                                  sn.metrics.pixels ==
                                      sn.metrics.maxScrollExtent &&
                                  productsCubit.page < productsCubit.maxPages) {
                                productsCubit.loadProducts(value: true);
                                productsCubit.incPage();
                                productsCubit.getProducts();
                                productsCubit.loadProducts(value: false);
                              }
                              return true;
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            productsCubit.products.length,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: .6,
                                                crossAxisSpacing: 10.w,
                                                mainAxisSpacing: 20.h),
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: ProductItem(
                                                  image: productsCubit
                                                      .products[index].images,
                                                  name: productsCubit
                                                      .products[index].name,
                                                  price: productsCubit
                                                      .products[index].price,
                                                  discount: productsCubit
                                                      .products[index]
                                                      .discount),
                                            )),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  if (productsCubit.loading)
                                    const Center(
                                        child: CircularProgressIndicator()),
                                  SizedBox(
                                    height: 20.h,
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                );
              } else {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No internet connection!",
                        style: AppTextStyle.title(),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.highlight_remove_rounded,
                        color: Colors.red,
                        size: 30.r,
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}

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
