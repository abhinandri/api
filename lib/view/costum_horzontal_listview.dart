import 'package:flutter/material.dart';

class CustomHorizontalListView extends StatelessWidget {
  final double itemWidth;
  final double itemHeight;
  final double listHeight;
  final int itemCount;
  final Color itemColor;
  final double borderRadius;
  final double spacing;

  const CustomHorizontalListView({
    super.key,
    this.itemWidth = 120,
    this.itemHeight = 100,
    this.listHeight = 160,
    this.itemCount = 6,
    this.itemColor = Colors.grey,
    this.borderRadius = 5,
    this.spacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            width: itemWidth,
            height: itemHeight,
            margin: EdgeInsets.only(right: spacing),
            decoration: BoxDecoration(
              color: itemColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          );
        },
      ),
    );
  }
}
