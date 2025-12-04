import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/features/cart/widgets/cart_item_widget.dart';
import 'package:store_app/features/cart/widgets/cart_bottom_bar.dart';
import 'package:store_app/features/payment/screens/payment_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          "سلة المشتريات",
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.items[index];
                    return CartItemWidget(
                      cartItem: cartItem,
                      onRemove: () {
                        cart.removeFromCart(cartItem.product);
                      },
                    );
                  },
                ),
              ),
              CartBottomBar(
                totalPrice: cart.totalPrice,
                onCheckout: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        totalAmount: cart.totalPrice,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
