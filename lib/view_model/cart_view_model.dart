import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/service/database/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  ValueNotifier <bool> get loading=>_loading;
  ValueNotifier <bool>  _loading =ValueNotifier(false);
  List <CartModel?>  _cartModel =[];

  List <CartModel?> get cartModel=>_cartModel;
    double   _totalPrice =0.0;
    double get  totalPrice => _totalPrice;
  var dbHelper = CartDatabase.db;




  CartViewModel(){
    getAllProduct();
  }
  getAllProduct()async{
    _loading.value=true;
    _cartModel= await dbHelper.getAllProduct();

print(  'lissssssssssssst   ${_cartModel.length}');

    _loading.value=false;

    getTotalPrice();

    update();
  }
  getTotalPrice(){
    for (int i=0;i<_cartModel.length;i++){
      _totalPrice+=(double.parse(_cartModel[i]!.price!)

          * _cartModel[i]!.quantity
      );
      print('totttttttal  ${_totalPrice}');
      update();
    }
  }


  addProduct (CartModel cartModel)async {


      for (int i=0;i < _cartModel.length; i++) {
        if (_cartModel[i]!.productId == cartModel.productId) {
          return;
        }
      }
       await dbHelper.insert(cartModel);
        print('iddddprrrrrrrr  ${cartModel.productId}');
        _cartModel.add(cartModel);
        _totalPrice += (double.parse(cartModel.price!)

       );


      update();

  }
  increaseQuantity(int index)async{
    _cartModel[index]!.quantity++;
    _totalPrice += (double.parse(_cartModel[index]!.price!));
  await  dbHelper.updateProduct(_cartModel[index]!);
    update();


        }
  decreaseQuantity(int index)async{
    _cartModel[index]!.quantity--;
    _totalPrice -= (double.parse(_cartModel[index]!.price!));
   await dbHelper.updateProduct(_cartModel[index]!);

    update();


        }

}