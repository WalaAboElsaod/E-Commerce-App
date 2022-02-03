// import 'dart:convert';
//
// import 'package:ecommerce_app/components/constant/endpoints.dart';
// import 'package:ecommerce_app/model/user_model.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CashHelper extends GetxController   {
//   // static late SharedPreferences sharedPreferences;
//   // static init() async {
//   //   // sharedPreferences=await sharedPreferences.getInt(key);
//   //   // SharedPreferences
//   //   sharedPreferences = await SharedPreferences.getInstance();
//
//   Future<UserModel> get userData  async{
//
//       UserModel userModel=await getUserData();
//         return userModel;
//       }
//
//
//   getUserData()async{
//     SharedPreferences prefs =await SharedPreferences.getInstance();
//
//   var value =  prefs.getString(CACHED_USER_DATA);
//   return UserModel.fromJson(json.decode(value.toString()));
//
//    }
//
//     setUser(UserModel userModel  )async{
//       SharedPreferences prefs =await SharedPreferences.getInstance();
//
//    var value =   await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
//     }
//     void deleteUser() async{
//       SharedPreferences prefs =await SharedPreferences.getInstance();
//
//       await prefs.clear();
//     }
//
//
//   }
//
//
// //
// //   static dynamic getData({
// //     required String key,
// //   }) {
// //     return sharedPreferences.get(key);
// //   }
// //
// //   static Future<bool> saveData({
// //     required String key,
// //     required dynamic value,
// //   }) async {
// //     if (value is String) return await sharedPreferences.setString(key, value);
// //     if (value is int) return await sharedPreferences.setInt(key, value);
// //     if (value is bool) return await sharedPreferences.setBool(key, value);
// //
// //     return await sharedPreferences.setDouble(key, value);
// //   }
// //
// //   static Future<bool> removeData({
// //     required String key,
// //   }) async {
// //     return await sharedPreferences.remove(key);
// //   }
//
















import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {

  static late SharedPreferences sharedPreferences;
  static init() async {
    // sharedPreferences=await sharedPreferences.getInt(key);
    // SharedPreferences
    sharedPreferences = await SharedPreferences.getInstance();
  }



  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}

