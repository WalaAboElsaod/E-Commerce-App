import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery  delivery =Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
     children: [
       SizedBox(height: 50,),
       RadioListTile<Delivery>(
         value: Delivery.StandardDelivery,
           groupValue:delivery ,
           onChanged: (  value){
           setState(() {
             delivery= value!;

           });
           }
           ,title: CustomText(
           text: 'Standard Delivery',fontsize: 20,
         ),
            subtitle:  CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',fontsize: 14,
            ),
         activeColor: mainColor,
           ),
       SizedBox(height: 20,),
       RadioListTile<Delivery>(
         value: Delivery.NextDayDelivery,
         groupValue:delivery ,
         onChanged: (  value){
           setState(() {
             delivery= value!;

           });
         }
         ,title: CustomText(
         text: 'Next Day Delivery',fontsize: 20,
       ),
         subtitle:  CustomText(
           text: '\nPlace your order before 6pm and your items will be delivered the next day',fontsize: 14,
         ),
         activeColor: mainColor,
       ),
       SizedBox(height: 20,),

       RadioListTile<Delivery>(
         value: Delivery.NominatedDelivery,
         groupValue:delivery ,
         onChanged: (  value){
           setState(() {
             delivery= value!;

           });
         }
         ,title: CustomText(
         text: 'Nominated Delivery',fontsize: 20,
       ),
         subtitle:  CustomText(
           text: '\nPick a particular date from the calendar and order will be delivered on selected date',fontsize: 14,
         ),
         activeColor: mainColor,
       ),


     ],
      ),
    );
  }
}