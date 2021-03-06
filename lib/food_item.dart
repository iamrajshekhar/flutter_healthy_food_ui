import 'package:flutter/material.dart';
import 'package:flutter_demo/food_details.dart';

class FoodItem extends StatelessWidget {
  final String imageName;
  final String foodName;
  final int price;

  const FoodItem({Key key, this.imageName, this.foodName, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 60, right: 20),
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetails(
                      price: price, imageName: imageName, foodName: foodName))),
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                    tag: imageName,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                color: Colors.grey.shade500,
                                spreadRadius: 5)
                          ],
                          image: DecorationImage(
                            image: AssetImage(imageName),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${price.toString()}",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ])
                ],
              ),
            ),
            Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}
