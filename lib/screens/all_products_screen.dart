import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/home/product_cart.dart';
import 'package:store_app/screens/details_screen.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          "كل المنتجات",
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPadding,
            crossAxisSpacing: kDefaultPadding,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) => ProductCard(
            itemIndex: index,
            product: products[index],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    product: products[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
