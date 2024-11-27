import 'package:ee_commerce/features/layouts/controllers/cubit/layout_cubit.dart';
import 'package:ee_commerce/features/layouts/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categoriesData =
        BlocProvider.of<LayoutCubit>(context).categories;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: categoriesData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Expanded(child: 
                Image.network(categoriesData[index].image!)),
                SizedBox(height: 15,),
                Text(categoriesData[index].name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            ),
          );
        },
      ),
    ));
  }
}
