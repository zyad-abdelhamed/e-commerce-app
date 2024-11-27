class CategoriesModel{
  int? id;
  String? image;
  String? name;
 CategoriesModel.fromJson({required Map<String,dynamic> data}){
  id = data['id'];
  image = data['image'];
  name = data['name'];

 }
}