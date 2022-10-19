
class prodModels{
  bool? status;
late  Datamodle data;

  prodModels.formJson(Map<String,dynamic>json){
    status=json['status'];
    data=Datamodle.formJson(json['data']);


  }


}


class Datamodle{
  List<bannersModle> banners=[];
  List<productsModel >products=[];

  Datamodle.formJson(Map<String,dynamic>json){
    json['banners'].forEach((element) {
      banners.add(bannersModle.formJson(element));
    });
    json['products'].forEach((element) {
      products.add(productsModel.formJson(element));
    });


  }

}



class bannersModle{
 int? id;
 String?image;

 bannersModle.formJson(Map<String,dynamic>json){
   id=json['id'];
   image=json['image'];

 }

}






class productsModel{
  late int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? in_favorites;
  bool? in_cart;

  productsModel.formJson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];

  }


}
