import 'package:flutter/material.dart';
import 'package:login_apps/components/rating_bar.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem({
    Key? key,
    required this.images,
  }) : super(key: key);
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/$images',
              fit: BoxFit.fill,
              height: 80,
              width: double.infinity,
            )),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Fried Rice",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
              RatingBar(
                size: 11,
              )
            ]),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Most Popular food in the world",
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 11),
              overflow: TextOverflow.ellipsis,
            )
          ],
        )
      ]),
    );
  }
}
