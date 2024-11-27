import 'package:ee_commerce/core/extentions/extention.dart';
import 'package:ee_commerce/features/layouts/controllers/cubit/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state)  {
         
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return  Scaffold(
            body:state is LoadingCartsDataSuccess? Center(child: CupertinoActivityIndicator()):
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: const Icon(Icons.search),
                        fillColor: const Color.fromARGB(255, 236, 234, 234),
                        filled: true,
                        suffixIcon: const Icon(Icons.cancel),
                        hintText: 'chp'.lang,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.carts.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromARGB(255, 236, 234, 234),
                            child: Row(
                              children: [
                                Image.network(
                                  cubit.carts[index].image!,
                                  width: 170,
                                  height: 150,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        cubit.carts[index].name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          '${cubit.carts[index].price!} \$'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(onPressed: () {
                                          showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [Text('Please Wait'),
                                                SizedBox(height: 15,),
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
                                          cubit.addandremovefavourites(productId: cubit.carts[index].id.toString());
                                        }, icon: Icon(Icons.favorite,color: cubit.favoritesId.contains(cubit.carts[index].id.toString())
                                          ? Colors.red
                                          : Colors.grey,)),
                                          IconButton(onPressed: () {
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
                                            cubit.addandremovecarts(id: cubit.carts[index].id.toString());
                                          }, icon: Icon(Icons.delete,color: Colors.red,))
                                      ],
                                     )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                  Container(child: Text('Total Price is:${cubit.totalprice}'),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}