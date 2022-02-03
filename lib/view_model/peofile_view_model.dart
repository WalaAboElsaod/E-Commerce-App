import 'dart:developer';

import 'package:ecommerce_app/helper/cash_helper.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController{
  // final CashHelper cashHelper=Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    late  UserModel userModel;

    // getCurrentUser();
  }



  // UserModel get userModel=> _userModel;
  late  UserModel userModel;
  // void getCurrentUser() async{
  //   await CashHelper;
  // }


  Future <void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    // cashHelper.deleteUser();
  }


}