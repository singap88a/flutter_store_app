import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/home/widgets/search_bar_widget.dart';
import 'package:store_app/features/home/widgets/banner_slider.dart';
import 'package:store_app/features/home/widgets/categories_section.dart';
import 'package:store_app/features/home/widgets/featured_products_slider.dart';
import 'package:store_app/features/home/widgets/special_offers_section.dart';
import 'package:store_app/features/home/widgets/best_selling_products.dart';
import 'package:store_app/features/home/widgets/brands_slider.dart';

class HomeBody extends StatelessWidget {
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
            SearchBarWidget(),
            
            SizedBox(height: kDefaultPadding),
            
            // 🎪 سلايدر البانر المتحرك
            BannerSlider(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 📁 قسم التصنيفات
            CategoriesSection(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🏆 قسم المنتجات المميزة
            FeaturedProductsSlider(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🔥 قسم العروض الخاصة
            SpecialOffersSection(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // ⭐ قسم المنتجات الأكثر مبيعاً
            BestSellingProducts(),
            
            SizedBox(height: kDefaultPadding * 1.5),
            
            // 🎯 قسم العلامات التجارية
            BrandsSlider(),
            
            SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
