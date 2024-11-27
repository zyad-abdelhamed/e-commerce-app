class User_Model{
  String? name;
  String? email;
  String? taken;
  String? phone;
  //User_Model(this.email,this.name,this.phone,this.taken);
  User_Model.formJson({required Map<String,dynamic> data}){
    name = data['name'] ;
    email = data['email'] ;
    taken = data['taken'] ;
   phone = data['phone'];
  
  }
}