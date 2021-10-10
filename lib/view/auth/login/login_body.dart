import 'package:ecommerce_app/components/componants.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/view_model/auth_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:ecommerce_app/widgets/custom_button_f_g.dart';
import 'package:ecommerce_app/widgets/custom_rounded_fieled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginBody extends GetWidget<AuthViewModel> {
  final controller =Get.put(AuthViewModel());
  FirebaseAuth _auth =FirebaseAuth.instance;





     //
  // var emailContrller = TextEditingController();
  //
  // var passwordContrller = TextEditingController();

  bool stc = false;
  bool ispasswordd = false;
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image(
                  image:NetworkImage('https://image.freepik.com/free-vector/sign-page-abstract-concept-illustration_335657-3875.jpg'),
                  // AssetImage(
                  //   'assets/images/reg.png',
                  // ),
                  width: size.width * .4,
                ),
              ),
              Text(
                'Welcome back!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'log in to your existant account of Q Allure',
                style: TextStyle(
                  // fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: size.width * .9,
                  child:  CostumFormField(
                    onChange: (val){
                      controller.email=val;
                    },
                    // controller: emailContrller,
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
                    }, isPassword: false,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: size.width * .9,
                  child: CostumFormField (
                    onChange: (val){
                      controller.password=val;
                    },
                    iconcolor: iconColor,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return (' Please enter your password');
                      }
                      return null;
                    },
                    onSubmit: (String value) {
                      print(value);
                    },
                    suffix:
                    ispasswordd ? Icons.visibility : Icons.visibility_off,
                    isPassword: ispasswordd,
                    suffixpressed: () {
                    //   setState(() {
                    //     ispasswordd = !ispasswordd;
                    //   });
                     },
                  )),

              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  child: Text(
                    ' forgot password?',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blueAccent),
                  ),
                  onPressed: () {},
                ),
              ]),
             CustomButton(background: Colors.orangeAccent,

               function: ()async {
                 formKey.currentState!.save();

                 if (
                 formKey.currentState!.validate()


                 ) {
                   controller.signIN();


                 }
    },

                  text: 'login',
                  width: size.width * .4,
                  radius: 30, isUpperCase: true,),
              SizedBox(
                height:40,
              ),
              Text(
                ' Or connect using',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[400]),
              ),
              SizedBox(
                height:20,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonFAndG(
                    radius: 10,
                    function: () {

                    },
                    text: 'Facebook',
                    width: size.width * .39,
                    height: size.height * .05,
                    background: Color(0xff375C8F),
                    icon: FontAwesomeIcons.facebook,

                  ),
                  CustomButtonFAndG(
                    radius: 10,
                    function: () {
                      controller.googleSignInMethod();
                    },
                    text: 'Google',
                    width: size.width * .39,
                    height: size.height * .05,
                    background: Colors.orangeAccent,
                    icon: FontAwesomeIcons.googlePlus,

                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(50)),

                  Text('Don\'t have an account? ',style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  ),),



                  GestureDetector(
                      onTap: (){

                        navigateTo(context, SignUPScreen());

                      },
                      child:Text('Sign Up'
                        ,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: defultColor),
                      )
                  ),


                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}
