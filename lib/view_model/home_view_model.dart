import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/categories_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewMdel extends GetxController {

 // List < CategoryModel>get categoryModel=>_categoryModel;
  ValueNotifier <bool> _loading=ValueNotifier(false);
  ValueNotifier <bool>  get  loading=>_loading;

 List < CategoryModel> categoryModel=[];
 List < ProductModel> productModel=[];
 List < DataModel> categoryProductModel=[];



  HomeViewMdel() {
    getCategory();
    // getCategoryProduct();
    getBestSellingPrudcts();
  }

  getCategory() async {
    _loading.value=true;
   await HomeService().getCategory().

    then((value) {
      for(int i=0;i<value.length;i++){
        categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value=false;

      }

      update();

    }
  );
}
//   getCategoryProduct() async {
//     _loading.value=true;
//    // await HomeService().getCategoryProduct().
//
//     then((value) {
//       for(int i=0;i<value.length;i++){
//         categoryProductModel.add(DataModel.fromjson(value[i].data()));
//         _loading.value=false;
//         print('cccccccccccccccc ${categoryProductModel}');
//
//
//       }
//
//       update();
//
//     }
//   );
// }
  getBestSellingPrudcts ()async{
    _loading.value=true;
    await HomeService().getBestSelling().then((value) {
        for(int i=0;i<value.length;i++){
          productModel.add(ProductModel.fromJson(value[i].data()));
          _loading.value=false;
          print(productModel.length);

        }
        update();

    });
  }
}
