import 'dart:ui';

import 'package:ee_commerce/features/layouts/controllers/cubit/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class Home_screen extends StatelessWidget {
  Home_screen({super.key});
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (input) {
                    cubit.Search(input: input);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(Icons.search),
                      fillColor: const Color.fromARGB(255, 236, 234, 234),
                      filled: true,
                      suffixIcon: const Icon(Icons.cancel),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                const SizedBox(
                  height: 15,
                ),
                cubit.banners.isEmpty
                    ? const CupertinoActivityIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 4,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Image.network(
                                  cubit.banners[index].image!,
                                  fit: BoxFit.fill,
                                ));
                          },
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 25.0,
                        dotWidth: 16.0,
                        dotHeight: 16.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                cubit.categories.isEmpty
                    ? const CupertinoActivityIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 8,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.categories.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                      cubit.categories[index].image!,
                                    )),
                                Text(
                                  cubit.categories[index].name!,
                                  style:
                                      const TextStyle(color: Colors.lightBlue),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                cubit.products.isEmpty
                    ? const CupertinoActivityIndicator()
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.filterproducts.isEmpty
                            ? cubit.products.length
                            : cubit.filterproducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.8,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            color: const Color.fromARGB(255, 236, 234, 234),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.network(cubit
                                            .filterproducts.isEmpty
                                        ? cubit.products[index].image!
                                        : cubit.filterproducts[index].image!)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  cubit.filterproducts.isEmpty
                                      ? cubit.products[index].name!
                                      : cubit.filterproducts[index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Text(
                                            '${cubit.filterproducts.isEmpty ? cubit.products[index].price! : cubit.filterproducts[index].price!}\$'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        if (cubit.filterproducts.isEmpty
                                            ? cubit.products[index].price !=
                                                cubit.products[index].oldprice
                                            : cubit.filterproducts[index]
                                                    .price !=
                                                cubit.filterproducts[index]
                                                    .oldprice)
                                          Text(
                                            '${cubit.filterproducts.isEmpty ? cubit.products[index].oldprice! : cubit.filterproducts[index].oldprice!}\$',
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          )
                                      ],
                                    )),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('Please Wait'),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CircularProgressIndicator()
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                        cubit.addandremovefavourites(
                                            productId:
                                                cubit.filterproducts.isEmpty
                                                    ? cubit.products[index].id!
                                                        .toString()
                                                    : cubit
                                                        .filterproducts[index]
                                                        .id!
                                                        .toString());
                                      },
                                      icon: const Icon(Icons.favorite),
                                      color: cubit.favoritesId.contains(cubit
                                                  .filterproducts.isEmpty
                                              ? cubit.products[index].id!
                                                  .toString()
                                              : cubit.filterproducts[index].id!
                                                  .toString())
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Please Wait'),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CircularProgressIndicator()
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      Future.delayed(
                                         Duration(seconds: 2),
                                        () {
                                          Navigator.of(context).pop();
                                          final isAddedToCart = cubit.cartsId.contains(cubit.products[index].id.toString());
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar( SnackBar(
                                            content: 
                                             Text(isAddedToCart ? 'تمت الحذف من السلة بنجاح' : 'تمت الاضافة الى السلة بنجاح'),
                                          ));
                                        },
                                      );

                                      cubit.addandremovecarts(
                                          id: cubit.filterproducts.isEmpty
                                              ? cubit.products[index].id!
                                                  .toString()
                                              : cubit.filterproducts[index].id!
                                                  .toString());
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: cubit.cartsId.contains(
                                              cubit.filterproducts.isEmpty
                                                  ? cubit.products[index].id!
                                                      .toString()
                                                  : cubit
                                                      .filterproducts[index].id!
                                                      .toString())
                                          ? Colors.red
                                          : Colors.grey,
                                      child: Icon(CupertinoIcons.cart),
                                    ))
                              ],
                            ),
                          );
                        },
                      )
              ],
            ),
          ));
        },
      ),
    );
  }
}
