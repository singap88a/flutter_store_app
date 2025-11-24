import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/details/details_body.dart';
import 'package:store_app/screens/cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'رجوع',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Badge(
                isLabelVisible: cart.itemCount > 0,
                label: Text(cart.itemCount.toString()),
                child: child!,
              ),
            );
          },
          child: IconButton(
            icon: Icon(Icons.shopping_cart, color: kPrimaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
