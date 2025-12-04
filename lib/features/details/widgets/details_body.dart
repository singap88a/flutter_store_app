import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/features/details/widgets/color_dot.dart';
import 'package:store_app/features/details/widgets/product_image.dart';
import 'package:store_app/features/cart/screens/cart_screen.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
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
                
                // Color Selection
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الألوان المتاحة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
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
                    ],
                  ),
                ),
                
                // Product Title
                Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: 24,
                        ),
                  ),
                ),
                
                // Price Section
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'السعر',
                              style: TextStyle(
                                fontSize: 14,
                                color: kTextLightColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    '\$${product.price}',
                                    style: TextStyle(
                                      fontSize: 28.0,
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
                            ),
                          ],
                        ),
                      ),
                      
                      if (product.discountPercentage > 0)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red.withOpacity(0.3)),
                          ),
                          child: Text(
                            '${product.discountPercentage}% خصم',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          
          // Description Section
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الوصف',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9), 
                    fontSize: 16.0, 
                    height: 1.6,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          
          // Action Button
          Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart logic
                  Provider.of<CartProvider>(context, listen: false).addToCart(product);
                  
                  // Professional Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      elevation: 6,
                      content: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.white, size: 24),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "تمت الإضافة بنجاح!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "تم إضافة ${product.title} إلى سلة التسوق",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white, size: 20),
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        ],
                      ),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'عرض السلة',
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartScreen()),
                          );
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  minimumSize: Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout,
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "إضافة إلى السلة",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
