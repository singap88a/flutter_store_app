import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
