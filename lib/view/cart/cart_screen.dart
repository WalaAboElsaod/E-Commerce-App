import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view/check_out/chech_out_view.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controler) => Scaffold(
        body: controler.cartModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/empty_card.svg',
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Cart Empty',
                    fontsize: 25,
                    alignment: Alignment.topCenter,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Container(
                                height: 140,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 140,
                                      child: Image(
                                        image: NetworkImage(
                                          controler.cartModel[index]!.image!,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: controler
                                                  .cartModel[index]!.name!,
                                              fontsize: 18),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text:
                                                '\$ ${controler.cartModel[index]!.price.toString()}',
                                            fontsize: 18,
                                            color: mainColor,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: Icon(Icons.add),
                                                  onTap: () {
                                                    controler.increaseQuantity(
                                                        index);
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                CustomText(
                                                    text: controler
                                                        .cartModel[index]!
                                                        .quantity
                                                        .toString(),
                                                    alignment: Alignment.center,
                                                    fontsize: 20),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  child: Icon(Icons.remove),
                                                  onTap: () {
                                                    controler.decreaseQuantity(
                                                        index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: controler.cartModel.length),
                    ),
                    //  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TOTAL',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                )),
                            SizedBox(height: 5),
                            // GetBuilder<CartViewModel>(
                            //   init: Get.find(),
                            //   builder: (Contro) =>

                                  Text(
                                  '\$'
                                  '${controler.totalPrice}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                  )),
                            //),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: CustomButton(
                          textColor: Colors.white,
                          width: 140,
                          isUpperCase: true,
                          text: 'CHECKOUT',
                          background: Colors.orangeAccent,
                          radius: 10,
                          function: () {
                            Get.to(CheckOutView());
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
