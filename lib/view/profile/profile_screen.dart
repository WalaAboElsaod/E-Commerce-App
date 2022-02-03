import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view_model/peofile_view_model.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => Scaffold(
              body:Container()
        //         Conditional.single(context: context,
        // conditionBuilder:
        // (context)=> controller.userModel!=null,
        // widgetBuilder: (context)=>   Container(
        //   padding: EdgeInsets.only(top: 50),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Container(
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               Container(
        //                 width: 100,
        //                 height: 100,
        //                 decoration: BoxDecoration(
        //                     color: Colors.red,
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(100),
        //                     ),
        //                     image: DecorationImage(
        //
        //                         image:
        //
        //                         NetworkImage(controller.userModel.pic!)
        //                         // 'https://image.freepik.com/free-photo/young-smiley-girl-portrait-pointing_23-2148333062.jpg')
        //                         ,fit: BoxFit.fill
        //
        //                     )),
        //
        //
        //               ),
        //               Column(
        //                 children: [
        //                   CustomText(text: controller.userModel.name!, fontsize: 20),
        //                   CustomText(text:  controller.userModel.email!, fontsize: 15),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 100,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){},
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Edit Profile',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_Edit-Profile.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){},
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Shipping Address',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_Location.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){},
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Order History',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_History.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){},
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Cards',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_Payment.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){},
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Notifications',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_Alert.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Container(
        //           child: MaterialButton(
        //             onPressed: (){
        //               Get.offAll(LoginScreen());
        //             },
        //             child: ListTile(
        //               title: CustomText(
        //                 text: 'Log Out',
        //                 fontsize: 20,
        //
        //               ),
        //               leading: Image.asset('assets/icons/Icon_Exit.png'),
        //               trailing: Icon(Icons.navigate_next,color: Colors.black,),
        //             ),
        //
        //
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //       ],
        //     ),
        //   ),
        // ),
        // fallbackBuilder: (context)=>Center(child: CircularProgressIndicator()))





            ));
  }
}
