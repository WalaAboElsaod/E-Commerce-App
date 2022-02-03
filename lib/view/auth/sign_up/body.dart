import 'package:ecommerce_app/components/componants.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/view_model/auth_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:ecommerce_app/widgets/custom_rounded_fieled.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';


class Body extends GetWidget<AuthViewModel> {
  FirebaseAuth _auth =FirebaseAuth.instance;
  final controller=Get.put(AuthViewModel());

  //
 //  var emailContrller = TextEditingController();
  //
  // var passwordContrller = TextEditingController();
  // var phoneContrller = TextEditingController();
  //
  // var NameContrller = TextEditingController();
  // var confirmContrller = TextEditingController();
   var formKey= GlobalKey<FormState>();
   bool ispasswordd = false;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: GetBuilder<AuthViewModel>(
          builder:(_)=> Column

        (children: [
            SizedBox(
              height: 60,
            ),
            CustomText(
              text: 'Let\'s Get started !',alignment: Alignment.center,color: Colors.black,fontsize: 30,isBold: true,

            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Create an account to get all features',alignment: Alignment.center,color: Colors.grey,fontsize: 15,isBold: false,

            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: size.width * .9,
                child: CostumFormField(
                  type: TextInputType.name,
                  onChange: (val){
                    controller.name=val;
                  },
                  label: 'Name',
                  prefix: Icons.person,
                  iconcolor: iconColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return (' Please enter your email address');
                    }
                    return null;
                  },

                )),
            SizedBox(
              height: 20,
            ),
            Container(

                width: size.width * .9,
                child: CostumFormField(
                  onChange: (value){
                    controller.email=value;
                  },

                  type: TextInputType.emailAddress,
                  label: 'Email',
                  prefix: Icons.email,
                  iconcolor: iconColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return (' Please enter your email address');
                    }
                    return null;
                  },
                  onSubmit: (String value) {
                    print(value);
                  },
                  isPassword: false,
                )),
            SizedBox(
              height: 20,
            ),
            // Container(
            //     width: size.width * .9,
            //     child: CostumFormField(
            //       // controller: phoneContrller,
            //       type: TextInputType.phone,
            //       label: 'Phone',
            //       prefix: Icons.phone_android,
            //       iconcolor: iconColor,
            //       validate: (String? value) {
            //         if (value!.isEmpty) {
            //           return (' Please enter your email address');
            //         }
            //         return null;
            //       },
            //
            //       isPassword: false,
            //     )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: size.width * .9,
                child:

                CostumFormField (
                  iconcolor: iconColor,
                  type: TextInputType.visiblePassword,
                  label: 'Password',

                  onChange: (value){
                    controller.password=value;
                    print(value);
                  },
                  prefix: Icons.lock,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return (' Please enter your password');
                    }
                    return null;
                  },

                  suffix:
                  ispasswordd ? Icons.visibility : Icons.visibility_off,
                  isPassword: ispasswordd,
                  suffixpressed: () {
                  //   setState(() {
                  //     ispasswordd = !ispasswordd;
                  //   });
                  },
                )),          SizedBox(
              height: 20,
            ),

            // Container(
            //     width: size.width * .9,
            //     child: CostumFormField(
            //       // controller: confirmContrller,
            //       type: TextInputType.visiblePassword,
            //       label: 'Confirm Password',
            //       prefix: Icons.lock,
            //       iconcolor: iconColor,
            //       validate: (String? value) {
            //         if (value!.isEmpty) {
            //           return (' Please enter your email address');
            //         }
            //         return null;
            //       },
            //       onSubmit: (String value) {
            //         print(value);
            //       },
            //       isPassword: false,
            //     )),//password
            SizedBox(
              height: 20,
            ),
            CustomButton(background: Colors.orangeAccent,
              textColor: Colors.white,

              function: ()async {
           formKey.currentState!.save();

                if (
                formKey.currentState!.validate()


                ) {
                  controller.createUser();



                  // await _auth.createUserWithEmailAndPassword(email: emailContrller.text, password: passwordContrller.text);
                }
              },

              text: 'Sign Up',
              width: size.width * .4,
              radius: 30, isUpperCase: true,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(30)),

                Text('Already have an account? ',style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15
                ),),



                GestureDetector(
                    onTap: (){

                      navigateTo(context, LoginScreen());

                    },
                    child:Text('Login'
                      ,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: defultColor),
                    )
                ),


              ],

            ),

          ]),
        ),
      ),
    );
  }
}
