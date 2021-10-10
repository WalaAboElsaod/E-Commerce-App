import 'package:flutter/material.dart';

import '../helper/extention.dart';

class ProductModel{
   String? name,description,image,size,price,type,productId;

 Color? color;
 ProductModel(
     this.name,
     this.productId,
     this.type,
     this.image,
     this.price,
     this.color,
     this.description,
     this.size,
     );
 ProductModel.fromJson( map)
 {
   if (map == null){
     return;
   }
   name=map['name'];
   productId=map['productId'];
   image=map['image'];
   price=map['price'];
   color=

        HexColor.fromHex(map['color']);
   description=map['description'];
   size=map['size'];
   type=map['type'];
 }
 toJson(){
   return
     {

       'name': name,
       'productId': productId,
       'image': image,
       'price': price,
       'description': description,
       'color': color,
       'size': size,
       'type': type



     };
 }

}