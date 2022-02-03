import 'package:ecommerce_app/components/constant/endpoints.dart';
import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/view/view_controller_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController{
  int _index =0;

  int get index =>_index;

  Pages _pages = Pages.DeliveryTime;
  Pages get pages=>_pages;
  String? street1,street2,city,country,state;
  GlobalKey<FormState> formState=GlobalKey();

void changeIndex (int i){
  if(i==0 || i<0){
    _pages=Pages.DeliveryTime;
    _index=i;
  }
 else if(i==1){
    _pages=Pages.AddAddress;
    _index=i;
  }
    else if(i == 2){
      formState.currentState!.save();
      if(formState.currentState!.validate()){
        _pages=Pages.Summary;
        _index=i;

      }

  }
    else if(i == 3){
    Get.to(ControlView());

  }
    update();
}
  Color getColor(int i) {
    if (index == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.deepOrange;
      // green;
    } else {
      return todoColor;
    }
  }
}