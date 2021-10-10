import 'package:ecommerce_app/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view_model/control_home_view_model.dart';
import 'package:ecommerce_app/view_model/home_view_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    void dependencies(){
      Get.lazyPut(()=>HomeViewMdel());

      Get.lazyPut(() => AuthViewModel());
      Get.lazyPut(() => ControlHomeViewModel());
      Get.lazyPut(() => CartViewModel());

    }
  }

}