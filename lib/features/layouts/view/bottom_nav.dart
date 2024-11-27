import 'package:ee_commerce/features/layouts/view/home_screen.dart';
import 'package:ee_commerce/features/layouts/controllers/cubit/layout_cubit.dart';
import 'package:ee_commerce/features/layouts/view/cart.dart';
import 'package:ee_commerce/features/layouts/view/categories.dart';
import 'package:ee_commerce/features/layouts/view/favourite.dart';
import 'package:ee_commerce/features/profile/view/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
final List<String> titles = const ['Home', 'Categories', 'Favourite','Cart','Profile'];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final controller = BlocProvider.of<LayoutCubit>(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.lightBlue,
              title: Text(
                titles[controller.selectedTapIndex],
              ),
            
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children:  [
               Home_screen(),
               Categories(),
               Favourite(),
                Cart(),
                Profile_Page()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.lightBlue,
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Colors.black,
              
            
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favourite'),
                     BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
