import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view_model/cart_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controler) => Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: controler.cartModel[index]!.name!,
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
                                          Icon(Icons.add),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                              text: "1",
                                              alignment: Alignment.center,
                                              fontsize: 20),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(Icons.remove),
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                    Text('\$${'1500'}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: CustomButton(
                  width: 140,
                  isUpperCase: true,
                  text: 'CHECKOUT',
                  background: Colors.orangeAccent,
                  radius: 10,
                  function: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
