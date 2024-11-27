
class ProductsModel{
  String? name;
  int? price;
  int? id;
  String? description;
  int? oldprice;
  String? image;
  int? discount;
  ProductsModel.fromjson({required Map<String,dynamic> data}){
    name= data['name'].toString();
    id= data['id'].toInt();
    description= data['description'].toString();
    oldprice= data['old_price'].toInt();
    image= data['image'].toString();
    discount= data['discount'].toInt();
    price= data['price'].toInt();
  }
}