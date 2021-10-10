import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view/cart/cart_screen.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:ecommerce_app/view/profile/profile_screen.dart';
import 'package:ecommerce_app/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view_model/control_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  final controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Get.find<AuthViewModel>().user == null ? LoginScreen():
       GetBuilder<ControlHomeViewModel>(
         init: ControlHomeViewModel(),
         builder:(cont) =>Scaffold(


             bottomNavigationBar: bottomNavigation(),

             body: cont.currentScreen
             ,
         ),
       )
        ,

         );
  }

  Widget bottomNavigation() =>
      GetBuilder<ControlHomeViewModel>(
        init: ControlHomeViewModel(),
        builder: (controller) =>

            BottomNavigationBar(
                onTap: (index) {
                  controller.changeIndexValue(index);
                },
                currentIndex: controller.navegatorValue,
                elevation: 0,
                selectedItemColor: Colors.black,
                backgroundColor:Colors.grey.shade50 ,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        'assets/images/explore.png',
                        fit: BoxFit.contain,
                        width: 30,
                      ),
                    ),
                    label: '',





                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          'Explore',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        'assets/images/carts.png',
                        fit: BoxFit.contain,
                        width: 30,
                      ),
                    ),
                    label: '',


                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          'Cart', style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(

                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.contain,
                        width: 30,
                      ),
                    ),
                    label: '',

                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('Account', style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
      );

}
