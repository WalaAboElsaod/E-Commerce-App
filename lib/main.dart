import 'package:ecommerce_app/helper/bindings.dart';
import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:ecommerce_app/view/view_controller_bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Binding() ,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:
      //Home(),
      //LoginScreen(),
     ControlView(),
    );
  }
}