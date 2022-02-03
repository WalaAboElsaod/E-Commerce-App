import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view_model/check_out_view_model.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(

        init: Get.find(),
        builder: (cont)=> SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 40,),

              Conditional.single(context: context,
                  conditionBuilder: (BuildContext context) =>
                    cont.cartModel !=null

                  ,
                  widgetBuilder: (BuildContext context)=>
                  Container(
                    height: 350,
                    padding: EdgeInsets.all(20),

                    child: ListView.separated(itemBuilder: (context,index){
                      return  Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Container(
                             width: 150,
                             height: 180,
                             child: Image(
                               image: NetworkImage(
                                 cont.cartModel[index]!.image!,

                               ),
                               fit: BoxFit.cover,
                             ),
                           ),
                            SizedBox(height: 10,),
                            RichText(
                              maxLines: 1,
                              textAlign: TextAlign.end,

                              text:TextSpan
                              (style: TextStyle(color: Colors.black),text:cont.cartModel[index]!.name!),),
                            SizedBox(height: 10,),

                            CustomText(
                              alignment:Alignment.bottomLeft ,
                              text:
                              '\$ ${cont.cartModel[index]!.price.toString()}',
                              fontsize: 18,
                              color: mainColor,
                            ),

                          ],

                        ),
                      );
                    },
                      itemCount:cont.cartModel.length ,
                       separatorBuilder: (context, index) =>SizedBox(width: 10,),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  fallbackBuilder: (BuildContext context) =>
                      Center(
                        child: CircularProgressIndicator(),
                      )

      ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CustomText(
                     text: 'Shipping Address',
                     fontsize: 24,
                   ),
                 ),
              GetBuilder<CheckOutViewModel>(
                init:Get.find()
                    ,
                  builder:(controller) => CustomText(
                    text: '${controller.street1! + ',' +controller.street2! + ',' +controller.city! + ',' +controller.country! + ',' +controller.state! }',
                    fontsize: 20,
                    color: Colors.black,
                  ),
              )

            ],
          ),
        ),

      ),
    );
  }
}