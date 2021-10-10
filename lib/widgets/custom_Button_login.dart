import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double width=double.infinity;
      Color background = Colors.orangeAccent;
  late double radius;
   Function? function;
  bool isUpperCase = true;
      late String text;
          CustomButton({
    required this.background,
            this.function,
            required this.isUpperCase,
            required this.radius,
            required this.text,
            required this.width,





  });
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: 50.00,
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      )
    );
  }
  
}
