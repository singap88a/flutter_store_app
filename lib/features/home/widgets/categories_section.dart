import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class CategoriesSection extends StatefulWidget {
  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedCategoryIndex = 0;

  List<Map<String, dynamic>> categoryItems = [
    {
      'icon': Icons.headset,
      'title': 'سماعات',
      'color': Color(0xFF40BAD5),
      'image': 'images/categoryItems/headset.Avif',
      'items': '120 منتج'
    },
    {
      'icon': Icons.phone_iphone,
      'title': 'هواتف',
      'color': Color(0xFF219ebc),
      'image': 'images/categoryItems/phone_iphone.png',
      'items': '85 منتج'
    },
    {
      'icon': Icons.camera_alt,
      'title': 'كاميرات',
      'color': Color(0xFF023e8a),
      'image': 'images/categoryItems/camera_alt.jpg',
      'items': '45 منتج'
    },
    {
      'icon': Icons.watch,
      'title': 'اكسسوارات',
      'color': Color(0xFFff9e00),
      'image': 'images/categoryItems/watch.png',
      'items': '200 منتج'
    },
    {
      'icon': Icons.laptop,
      'title': 'لابتوب',
      'color': Color(0xFFe63946),
      'image': 'images/categoryItems/laptop.jpg',
      'items': '60 منتج'
    },
    {
      'icon': Icons.tv,
      'title': 'تلفزيونات',
      'color': Color(0xFF2a9d8f),
      'image': 'images/categoryItems/tv.webp',
      'items': '30 منتج'
    },
    {
      'icon': Icons.kitchen,
      'title': 'أجهزة منزلية',
      'color': Color(0xFF9d4edd),
      'image': 'images/categoryItems/home_appliances.jpg',
      'items': '75 منتج'
    },
    {
      'icon': Icons.watch,
      'title': 'ساعات ذكية',
      'color': Color(0xFFf72585),
      'image': 'images/categoryItems/smartwatch.jpg',
      'items': '50 منتج'
    },
  ];

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
                "التصنيفات",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to all categories
                },
                child: Text(
                  "عرض الكل",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
              var category = categoryItems[index];
              
              return Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selectedCategoryIndex == index
                          ? category['color'].withOpacity(0.9)
                          : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selectedCategoryIndex == index
                            ? Colors.white
                            : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  category['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      category['icon'],
                                      color: Colors.white,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -2,
                              right: -2,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: category['color'],
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 1),
                                ),
                                child: Icon(
                                  category['icon'],
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          category['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          category['items'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
