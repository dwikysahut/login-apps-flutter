import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_apps/bloc/cart.dart';
import 'package:login_apps/components/rating_bar.dart';
import 'package:login_apps/model/cart/cart.dart';
import 'package:login_apps/model/food/food_model.dart';

class ModalBottomItem {
  static Future<dynamic> renderModal(BuildContext context) {
    CartProvider cartProvider = BlocProvider.of<CartProvider>(context);

    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (context) {
          return Flexible(
            child: SizedBox(
              height: 330,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/food-2.jpeg',
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fried Rice",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        RatingBar(
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Most Popular food in the world,Most Popular food in the world Most Popular food in the world",
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            cartProvider.addToCart(
                                CartModel(id: '1', nama: 'fried rice', qty: 1));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[800],
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
