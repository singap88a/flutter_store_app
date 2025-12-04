import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class BrandsSlider extends StatelessWidget {
  final List<Map<String, dynamic>> brands = [
    {
      'name': 'Apple',
      'image': 'images/brands/Apple.webp',
      'products': '45 منتج'
    },
    {
      'name': 'Samsung',
      'image': 'images/brands/Samsung.jpg',
      'products': '38 منتج'
    },
    {
      'name': 'Sony',
      'image': 'images/brands/Sony.png',
      'products': '25 منتج'
    },
    {
      'name': 'Xiaomi',
      'image': 'images/brands/Xiaomi.png',
      'products': '32 منتج'
    },
    {
      'name': 'Huawei',
      'image': 'images/brands/Huawei.png',
      'products': '28 منتج'
    },
    {
      'name': 'Dell',
      'image': 'images/brands/Dell.png',
      'products': '22 منتج'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "العلامات التجارية",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          brands[index]['image'],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 25,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      brands[index]['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      brands[index]['products'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
