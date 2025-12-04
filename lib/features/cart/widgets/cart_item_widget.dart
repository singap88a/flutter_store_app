import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: ListTile(
        leading: Image.asset(cartItem.product.image),
        title: Text(cartItem.product.title),
        subtitle: Text("${cartItem.quantity} x \$${cartItem.product.price}"),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
