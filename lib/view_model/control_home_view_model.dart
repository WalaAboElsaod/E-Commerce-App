import 'package:ecommerce_app/view/cart/cart_screen.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:ecommerce_app/view/profile/profile_screen.dart';
import 'package:ecommerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlHomeViewModel extends GetxController{
  Widget _currentScreen=Home();

  int _navegatorValue=0;
  get currentScreen =>_currentScreen;
  get navegatorValue =>_navegatorValue;
  void changeIndexValue (indexvalue){
    switch (indexvalue){
      case 0:{
        _currentScreen=Home();
        break;
      }
      case 1:{
        _currentScreen=CartScreen();
        break;
      } case 2:{
      _currentScreen=ProfileScreen();
      break;
    }
    }
    _navegatorValue=indexvalue;
    update();


  }


}