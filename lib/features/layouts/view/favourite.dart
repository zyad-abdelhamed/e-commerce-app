import 'package:ee_commerce/features/layouts/controllers/cubit/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state)  {
         
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return  Scaffold(
            body:state is LoadingFavouritesDataLoading? const Center(child: CupertinoActivityIndicator())    :Padding(
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
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.favourites.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromARGB(255, 236, 234, 234),
                            child: Row(
                              children: [
                                Image.network(
                                  cubit.favourites[index].image!,
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
                                        cubit.favourites[index].name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          '${cubit.favourites[index].price!} \$'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        color: Colors.lightBlue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
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
                                          cubit.addandremovefavourites(
                                              productId: cubit
                                                  .favourites[index].id
                                                  .toString());
                                        },
                                        child:  const Text('remove'),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
