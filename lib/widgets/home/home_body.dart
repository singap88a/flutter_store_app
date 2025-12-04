import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/details_screen.dart';
import 'package:store_app/widgets/home/product_cart.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int selectedCategoryIndex = 0;
  int _currentBannerIndex = 0;
  int _currentProductIndex = 0;
  int _currentBestSellingIndex = 0;
  
  final PageController _bannerController = PageController();
  final PageController _productController = PageController(viewportFraction: 0.65);
  final PageController _bestSellingController = PageController(viewportFraction: 0.65);
  
  List<String> categories = ["الكل", "سماعات", "هواتف", "كاميرات", "اكسسوارات", "لابتوب", "تلفزيونات", "أجهزة منزلية"];
  
  List<Map<String, dynamic>> banners = [
    {
      'image': 'images/hero.jpg',
      'title': 'عروض الصيف',
      'subtitle': 'خصم يصل إلى 40%',
      'color': Color(0xFF40BAD5)
    },
    {
      'image': 'images/hero_2.jpg',
      'title': 'أحدث المنتجات',
      'subtitle': 'تكنولوجيا متطورة',
      'color': Color(0xFF219ebc)
    },
    {
      'image': 'images/hero_3.webp',
      'title': 'عروض حصرية',
      'subtitle': 'أسعار لا تُعوض',
      'color': Color(0xFF023e8a)
    }
  ];

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
      'icon': Icons.watch, // استخدمت Icons.watch بدل smartwatch
      'title': 'ساعات ذكية',
      'color': Color(0xFFf72585),
      'image': 'images/categoryItems/smartwatch.jpg',
      'items': '50 منتج'
    },
  ];

  List<Map<String, dynamic>> brands = [
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
  void initState() {
    super.initState();
    _startBannerAutoScroll();
    _startProductAutoScroll();
    _startBestSellingAutoScroll();
  }

  void _startBannerAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (_bannerController.hasClients && banners.length > 1) {
        int nextPage = _currentBannerIndex + 1;
        if (nextPage >= banners.length) nextPage = 0;
        
        _bannerController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startBannerAutoScroll();
      }
    });
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

  void _startBestSellingAutoScroll() {
    Future.delayed(Duration(seconds: 5), () {
      if (_bestSellingController.hasClients && products.length > 1) {
        int nextPage = _currentBestSellingIndex + 1;
        if (nextPage >= products.take(5).length) nextPage = 0;
        
        _bestSellingController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _startBestSellingAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _productController.dispose();
    _bestSellingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultPadding / 2),
            
            // 🔍 شريط البحث المحترف
            _buildSearchBar(),
            
            SizedBox(height: kDefaultPadding),
            
            // 🎪 سلايدر البانر المتحرك
            _buildBannerSlider(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 📁 قسم الكاتيجوريات المتحرك - محدث ومصحح
            _buildCategoriesSection(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🏆 قسم المنتجات المميزة المتحرك - كارد ونص
            _buildFeaturedProductsSlider(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🔥 قسم العروض الخاصة
            _buildSpecialOffers(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // ⭐ قسم المنتجات الأكثر مبيعاً - كارد ونص
            _buildBestSellingProducts(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🎯 قسم العلامات التجارية - سلايدر متحرك
            _buildBrandsSlider(),
            
            SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white.withOpacity(0.8), size: 24),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ابحث عن المنتجات...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.filter_list, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSlider() {
    return Container(
      height: 180,
      child: Stack(
        children: [
          PageView.builder(
            controller: _bannerController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(banners[index]['image']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        banners[index]['color'].withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banners[index]['title'],
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              banners[index]['subtitle'],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Text(
                                'تسوق الآن',
                                style: TextStyle(
                                  color: banners[index]['color'],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentBannerIndex == index ? 25 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentBannerIndex == index 
                        ? Colors.white 
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
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
                        // دائرة الصورة مع أيقونة
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
                                    // لو الصورة مش موجودة نعرض أيقونة
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

  Widget _buildFeaturedProductsSlider() {
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

  Widget _buildSpecialOffers() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Color(0xFF40BAD5), Color(0xFF219ebc)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "عروض خاصة!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "خصم يصل إلى 50% على أحدث المنتجات. عرض لفترة محدودة",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "استفد الآن",
                    style: TextStyle(
                      color: Color(0xFF219ebc),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
            child: Icon(Icons.offline_bolt, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildBestSellingProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الأكثر مبيعاً",
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
            controller: _bestSellingController,
            onPageChanged: (index) {
              setState(() {
                _currentBestSellingIndex = index;
              });
            },
            itemCount: products.take(5).length,
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
            products.take(5).length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: _currentBestSellingIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentBestSellingIndex == index 
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

  Widget _buildBrandsSlider() {
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