import 'package:ecommerce_app/components/constant/endpoints.dart';
import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/view/check_out/add_address.dart';
import 'package:ecommerce_app/view/check_out/delevery.dart';
import 'package:ecommerce_app/view/check_out/summary.dart';
import 'package:ecommerce_app/view_model/check_out_view_model.dart';
import 'package:ecommerce_app/widgets/custom_Button_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class CheckOutView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller)=>



      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                  MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  contentWidgetBuilder: (context,index){
                return Container();

                },


                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );

                    }


                    else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.index) {
                        final prevColor = controller.getColor(index - 1);
                        final color =controller. getColor(index);
                        var  gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)!
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color:controller. getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
          controller.pages ==Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                ? AddAddress()

                : Summary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               controller.index==0?
               Container()


                   :  Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:  const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: CustomButton(
                      textColor: mainColor,
                      function: (){
                        controller.changeIndex(controller.index -1);

                      },
                        background:  Colors.grey.shade200,
                        isUpperCase: true,
                        radius: 10,
                        text: 'Back',
                        width: 140
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:  const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: CustomButton(
                        textColor: Colors.white,
                        function: (){
                          controller.changeIndex(controller.index +1);

                        },
                        background: mainColor,
                        isUpperCase: true,
                        radius: 10,
                        text: 'next',
                        width: 140
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        // ),
      ),

    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
