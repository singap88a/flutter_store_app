import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/features/details/screens/details_screen.dart';
import 'package:store_app/features/home/widgets/product_card.dart';

class FeaturedProductsSlider extends StatefulWidget {
  @override
  _FeaturedProductsSliderState createState() => _FeaturedProductsSliderState();
}

class _FeaturedProductsSliderState extends State<FeaturedProductsSlider> {
  int _currentProductIndex = 0;
  final PageController _productController = PageController(viewportFraction: 0.65);

  @override
  void initState() {
    super.initState();
    _startProductAutoScroll();
  }

  void _startProductAutoScroll() {
    Future.delayed(Duration(seconds: 4), () {
      if (_productController.hasClients && products.length > 1) {
        int nextPage = _currentProductIndex + 1;
        if (nextPage >= products.length) nextPage = 0;
        
        _productController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _startProductAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المنتجات المميزة",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Text(
                  "عرض الكل",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          height: 280,
          child: PageView.builder(
            controller: _productController,
            onPageChanged: (index) {
              setState(() {
                _currentProductIndex = index;
              });
            },
            itemCount: products.length,
            padEnds: false,
            itemBuilder: (context, index) {
              return Transform.scale(
                scale: 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ProductCard(
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
              );
            },
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            products.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: _currentProductIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentProductIndex == index 
                    ? Colors.white 
                    : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
