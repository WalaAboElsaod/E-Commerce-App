class CartModel{
  String?name,image,price,productId;
  late int quantity;
  CartModel({this.name,this.image, required this.quantity,this.price,this.productId});
  CartModel.fromJson(Map <dynamic,dynamic> map)
  {
    if (map == null){
      return;
    }
    name=map['name'];
    productId=map['productId'];
    image=map['image'];
    price=map['price'];
    quantity=map['quantity'];
  }
  toJson(){
    return{
      'name':name,
      'image':image,
      'price':price,
      'productId':productId,
    'quantity':quantity,

  };
  }





}