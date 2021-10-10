import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/service/database/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  ValueNotifier <bool> get loading=>_loading;
  ValueNotifier <bool>  _loading =ValueNotifier(false);
  List <CartModel?>  _cartModel =[];

  List <CartModel?> get cartModel=>_cartModel;

  CartViewModel(){
    getAllProduct();
  }
  getAllProduct()async{
    _loading.value=true;
    var dbHelper =CartDatabase.db;
    _cartModel= await dbHelper.getAllProduct();

print(  'lissssssssssssst   ${_cartModel.length}');

    _loading.value=false;

    update();
  }


  addProduct (CartModel cartModel) {
    for (int i=0; i < _cartModel.length; i++) {
      if (_cartModel[i]!.productId == cartModel.productId) {
        return;
      }
      else {
        var dbHelper = CartDatabase.db;
        dbHelper.insert(cartModel);

      }
    }
    update();

  }
}