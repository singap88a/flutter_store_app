import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/details/color_dot.dart';
import 'package:store_app/widgets/details/product_image.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Background
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: '${product.id}',
                    child: ProductImage(
                      size: size,
                      image: product.image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorDot(
                        fillColor: kTextLightColor,
                        isSelected: true,
                      ),
                      ColorDot(
                        fillColor: Colors.blue,
                        isSelected: false,
                      ),
                      ColorDot(
                        fillColor: Colors.red,
                        isSelected: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'السعر: \$${product.price}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: kSecondaryColor,
                      ),
                    ),
                    if (product.discountPercentage > 0) ...[
                      SizedBox(width: 10),
                      Text(
                        '\$${product.oldPrice}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: kTextLightColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          // Description
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 2,
            ),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.white, fontSize: 16.0, height: 1.5),
            ),
          ),
          // Action Buttons
          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white, // Changed background to white for contrast
              borderRadius: BorderRadius.circular(30),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Immediate feedback and logic
                  Provider.of<CartProvider>(context, listen: false).addToCart(product);
                  
                  // Custom professional snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      content: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.white),
                          SizedBox(width: 10),
                          Text("تمت الإضافة للسلة بنجاح!"),
                        ],
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart_checkout),
                label: Text(
                  "إضافة للسلة",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
