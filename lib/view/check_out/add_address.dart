import 'package:ecommerce_app/view_model/check_out_view_model.dart';
import 'package:ecommerce_app/widgets/Custom_form_fieled_checkout.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.put(CheckOutViewModel()),
      builder: (controller)=>Form(
        key: controller.formState,
        child: Expanded(

          child: Padding(



            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(

              child: Column(
                children: [

                  SizedBox(height: 20,),
                  CustomText(text: 'Billing address is the same as delivery address', fontsize: 18,
                    alignment: Alignment.center,),
                  SizedBox(height: 20,),
                  CostumFormFieldCheck(
                    hint: '21, Alex Davidson Avenue',
                    validate: (value){
                      if(value.isEmpty){
                        return 'you must  write your street1';
                      }
                    },
                    onsaved: (value){
                      controller.street1=value;
                    },
                    text:'Sreet 1',
                  ),
                  SizedBox(height: 20,),
                  CostumFormFieldCheck(
                    hint: 'Opposite Omegatron, Vicent Quarters',
                    validate: (value){
                      if(value.isEmpty){
                        return 'you must  write your street2';
                      }
                    },
                    onsaved: (value){
                      controller.street2=value;
                    },
                    text:'Sreet 2',
                  ),
                  SizedBox(height: 20,),
                  CostumFormFieldCheck(
                    hint: 'Victoria Island',
                    validate: (value){
                      if(value.isEmpty){
                        return 'you must  write your City';
                      }
                    },
                    onsaved: (value){
                      controller.city=value;
                    },
                    text:'City',
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Expanded(
                        child: CostumFormFieldCheck(
                          hint: 'Lagos State',

                          validate: (value){
                            if(value.isEmpty){
                              return 'you must  write your Country';
                            }
                          },
                          onsaved: (value){
                            controller.country=value;
                          },
                          text:'Country',
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: CostumFormFieldCheck(

                          hint: 'Nigeria',
                          validate: (value){
                            if(value.isEmpty){
                              return 'you must  write your State';
                            }
                          },
                          onsaved: (value){
                            controller.state=value;
                          },
                          text:'State',
                        ),
                      ),

                    ],
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}