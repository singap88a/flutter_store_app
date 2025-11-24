import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/screens/cart_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/all_products_screen.dart'; // We will create this
import 'package:store_app/models/cart.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AllProductsScreen(), // Placeholder for now
    CartScreen(), // Placeholder for now
    Container(), // Placeholder for Profile or Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: kPrimaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: kPrimaryColor.withOpacity(0.1),
              color: Colors.grey[600],
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'الرئيسية',
                ),
                GButton(
                  icon: Icons.grid_view,
                  text: 'المنتجات',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'السلة',
                  leading: Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return Badge(
                        isLabelVisible: cart.itemCount > 0,
                        label: Text(cart.itemCount.toString()),
                        child: Icon(Icons.shopping_cart, color: _selectedIndex == 2 ? kPrimaryColor : Colors.grey[600]),
                      );
                    },
                  ),
                ),
                GButton(
                  icon: Icons.person,
                  text: 'حسابي',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
