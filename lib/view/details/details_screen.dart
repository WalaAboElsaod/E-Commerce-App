import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel? model;
  DetailsScreen({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            // CarouselSlider(
            //   items: [
                Image(
                  image: NetworkImage(
                    model!.image!,
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            //  ],
              // options: CarouselOptions(
              //   height: 250,
              //   viewportFraction: 1.0,
              //   initialPage: 0,
              //   enableInfiniteScroll: true,
              //   reverse: false,
              //   autoPlay: true,
              //   autoPlayInterval: Duration(seconds: 3),
              //   autoPlayAnimationDuration: Duration(seconds: 1),
              //   autoPlayCurve: Curves.fastOutSlowIn,
              //   scrollDirection: Axis.horizontal,
            //   ),
           // ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          text: model!.name!,
                          fontsize: 26,
                          isBold: true,
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              width: Get.width * .44,
                              height: Get.height * .05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                    fontsize: 15,
                                    isBold: true,
                                  ),
                                  CustomText(
                                    text: model!.size!,
                                    fontsize: 15,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black

                                      // model!.color
                                      )),
                              width: Get.width * .44,
                              height: Get.height * .05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                    fontsize: 15,
                                    isBold: true,
                                  ),
                                  Container(
                                    width: 25,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color:model!.color,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        CustomText(
                          text: 'Details',
                          fontsize: 20,
                          isBold: true,
                        ),
                        CustomText(
                          text: model!.description!,
                          fontsize: 18,
                          height: 2.5,
                        ),
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PRICE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          )),
                      SizedBox(height: 5),
                      Text('\$${model!.price}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          )),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller)=> Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      isUpperCase: true,
                      width: Get.width * .4,
                      text: 'Add',
                      background: Colors.orangeAccent,
                      radius: 10,
                      function: () =>
                        controller.addProduct(CartModel(
                            name:model!.name,
                            image:model!.image,
                            price:model!.price,
                          productId:model!.productId,
                        quantity:1,
                        ))

                      ,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
