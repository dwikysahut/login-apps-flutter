import 'package:flutter/material.dart';
import 'package:login_apps/components/discover_item_widget.dart';

class DiscoverListItem extends StatelessWidget {
  DiscoverListItem({
    Key? key,
  }) : super(key: key);

  final List<String> array = [
    'food-1.jpeg',
    'food-2.jpeg',
    'food-3.jpeg',
    'food-4.jpeg',
    'food-5.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return DiscoverItem(
              images: array[index],
            );
          }),
    );
  }
}
