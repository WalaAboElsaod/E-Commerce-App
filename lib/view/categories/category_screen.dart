import 'package:ecommerce_app/styles/colors.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:Icon(Icons.arrow_back_ios,color: Colors.black,),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Women',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                color: Colors.grey[100],
                child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 1 / 1.72,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      buildGridProduct(),
                      buildGridProduct(),
                      buildGridProduct(),
                      buildGridProduct(),
                      buildGridProduct(),
                      buildGridProduct(),
                    ])),
          ],
        ),
      ) ,
    );
  }
}
Widget buildGridProduct() => Container(
  color: Colors.white,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Image(
            image: NetworkImage(
                'https://image.freepik.com/free-vector/seasonal-sale-discounts-presents-purchase-visiting-boutiques-luxury-shopping-price-reduction-promotional-coupons-special-holiday-offers-vector-isolated-concept-metaphor-illustration_335657-2766.jpg'),
            width: double.infinity,
            height: 200,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'bags',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12.0, height: 1.5, fontWeight: FontWeight.bold),
            ),
            Row(children: [
              Text(
                '\$200  ',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 15.0,
                    child: Icon(
                      Icons.favorite_border,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ))
            ]),
          ],
        ),
      ),
    ],
  ),
);
