import 'package:ecommerce_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_app/view/categories/category_screen.dart';
import 'package:ecommerce_app/view/details/details_screen.dart';
import 'package:ecommerce_app/view_model/home_view_model.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  HomeViewMdel cont =Get.put(HomeViewMdel());
  @override
  Widget build(BuildContext context) {

      return
        GetBuilder<HomeViewMdel>(
            init: HomeViewMdel(),
            builder:(cotroller)=>(
        cont.loading.value?Center(child: CircularProgressIndicator()) :
      Scaffold(

        body:


              Container(
            padding: EdgeInsets.only(top: Get.height * .07, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  CustomText(
                    color: Colors.black,
                    text: 'Categories',
                    fontsize: 20,
                    alignment: Alignment.topLeft,
                    isBold: true,
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(CategoryScreen());
                    },
                    child:



                       Container(
                        height: Get.height * .15,
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => categoryBuilder(index),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: cont.categoryModel.length),
                      )

                  //   ),
                  // )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        color: Colors.black,
                        text: 'Best Seller',
                        fontsize: 20,
                        alignment: Alignment.topLeft,
                        isBold: true,
                      ),
                      CustomText(
                        color: Colors.black,
                        text: 'See All',
                        fontsize: 20,
                        alignment: Alignment.topLeft,
                        isBold: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),

                  // GestureDetector(
                  //   onTap: ()=>
                  //       Get.to(DetailsScreen(
                  //      //   model: cont.productModel[index],
                  //       ))
                  //   ,
                  //   child:
                    Container(
                      height: Get.height * .5,
                      child:

                      ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap:()=> Get.to(DetailsScreen(
                              model: cont.productModel[index],
                            )),
                            child: Container(
                                width: Get.width * .4,


                                child: productBuilder(index)),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: cont.productModel.length),
                    ),
                //  ),


                ],
              ),
            ),
          ),
      //  ),
   //   ),


    )
    )
    );

  }
  Widget categoryBuilder(index) =>


              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 7)
                    ], shape: BoxShape.circle, color: Colors.grey.shade200),
                    child:Image.network(cont.categoryModel[index].image.toString())

                    ,
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: cont.categoryModel[index].name!,
                    fontsize: 15,
                  )
                ],
              );


  Widget productBuilder(index) => Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 5,
      ),
      Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(right: 7),
        height: Get.height * .35,
        width: Get.width * .45,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 7)
        ], color: Colors.grey.shade200),
        child: Image(
          image: NetworkImage(
            cont.productModel[index].image!
          ),
          fit: BoxFit.fill,
          width: double.infinity,
          height: Get.height * .35,
        ),
        // padding: EdgeInsets.all(10),
      ),
      SizedBox(
        height: 5,
      ),
      CustomText(
        text:cont.productModel[index].name!,
        fontsize: 15,
        isBold: true,
      ),
      GestureDetector(
        onTap: (){
          Get.to(LoginScreen());
        },
        child: CustomText(
          text: cont.productModel[index].type!,
          maxLine: 1,
          fontsize: 10,
          isBold: true,
        ),
      ),
      Text(' \$  ${cont.productModel[index].price}',
          style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 12,
              fontWeight: FontWeight.bold)

        // color: Colors.orangeAccent

      ),

    ],
  );



}


