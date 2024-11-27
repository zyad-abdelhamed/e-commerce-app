import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ee_commerce/core/consetent/consetent.dart';
import 'package:ee_commerce/features/layouts/models/banner_model.dart';
import 'package:ee_commerce/features/layouts/models/categories_model.dart';
import 'package:ee_commerce/features/layouts/models/proudects_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial()) {
    getBannerData();
    getCategoriesData();
    getProdectsData();
    getFavouritesData();
    getCarts();
  }
  int selectedTapIndex = 0;
  final PageController pageController = PageController();
  List<BannerModel> banners = [];
  List<CategoriesModel> categories = [];
  Set<String> favoritesId = {}; 

  void onChangeTabIndex(int index) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);

    emit(DashboardChangeState());
  }

  void getBannerData() async {
    Response response =
        await http.get(Uri.parse('https://student.valuxapps.com/api/banners'));
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == true) {
      for (var item in responsebody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(BannersDataSuccess());
    } else {
      emit(FailedToBannersData());
    }
  }

  void getCategoriesData() async {
    Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/categories'));
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == true) {
      for (var item in responsebody['data']['data']) {
        categories.add(CategoriesModel.fromJson(data: item));
      }
      emit(CategoriesDataSuccess());
    } else {
      emit(FailedToCategoriesData());
    }
  }

  List<ProductsModel> products = [];
  void getProdectsData() async {
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/home'),
        headers: {"Authorization": token!});
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == true) {
      for (var item in responsebody['data']['products']) {
        products.add(ProductsModel.fromjson(data: item));
      }
      emit(ProdectsDataSuccess());
    } else {
      emit(FailedToProdectsData());
    }
  }

  List<ProductsModel> filterproducts = [];
  void Search({required String input}) {
    filterproducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
        emit(FilterProdectsDataSuccess());
  }

 List<ProductsModel> favourites = [];
 Future<void> getFavouritesData() async {
  emit(LoadingFavouritesDataLoading());
  favourites.clear();
  
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {"Authorization": token!});
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == true) {
      for (var item in responsebody['data']['data']) {
        favourites.add(ProductsModel.fromjson(data: item['product']));
        favoritesId.add(item['product']['id'].toString());
      }
      emit(FavouritesDataSuccess());
    } else {
      emit(FailedToFavouritesData());
    }
  }

void addandremovefavourites({required String productId})async{
Response response =await  http.post(
    Uri.parse('https://student.valuxapps.com/api/favorites'),
    headers: {
      'Authorization' : token!
    },
    body: {
      'product_id' : productId
    }

  );
  var responseBody =jsonDecode(response.body);
  if(responseBody['status']==true){
    if(favoritesId.contains(productId)){
      favoritesId.remove(productId);
    }else{
      favoritesId.add(productId);
    }
    await getFavouritesData();
    emit(AddAndRemoveFavouritesDataSuccess());
  }else{
    emit(FailedToAddAndRemoveFavouritesData());
  }
}

 List<ProductsModel> carts = [];
 int totalprice =0;
 Future<void> getCarts()async{
  carts.clear();
  emit(LoadingCartsDataSuccess());
  Response response = await http.get(
    Uri.parse('https://student.valuxapps.com/api/carts'),
    headers: {
      "Authorization" : token!
    }
  );
  var responseBody = jsonDecode(response.body);
    totalprice = responseBody['data']['total'].toInt() ?? 0;
if(responseBody['status']==true){
 
  for(var item in responseBody['data']['cart_items']){
    cartsId.add(item['product']['id'].toString());
    carts.add(ProductsModel.fromjson(data: item['product']));
    emit(CartsDataSuccess());
  }
}else{
    emit(FailedToCartsData());
  }
 }

Set<String> cartsId={};
void addandremovecarts({required String id})async{
  Response response= await http.post(
    Uri.parse('https://student.valuxapps.com/api/carts'),
    headers: {
      'Authorization' : token!
    },
    body: {
      'product_id' : id
    }
  );
  var responseBody = jsonDecode(response.body);

  if(responseBody['status']== true){
    if(cartsId.contains(id)){
      cartsId.remove(id);
    }else{
      cartsId.add(id);
    }
   await getCarts();
    emit(AddAndRemoveCartsDataSuccess());
  }else{
    emit(FailedToAddAndRemoveCartsData());
  }
}
}
