import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rp.2000", style: TextStyle(fontSize: 18)),
              Container(
                  width: 100.0,
                  height: 50.0,
                  child: Container(
                      width: 100.0,
                      height: 50.0,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Food",
                            style: TextStyle(fontSize: 12),
                          ))))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchI",
                style: TextStyle(
                  fontSize: 12,
                )),
            const SizedBox(
              height: 8,
            ),
            // ignore: avoid_print
            OutlinedButton(onPressed: () {}, child: const Text("Add to Cart"))
          ],
        ),
      ]),
    );
  }
}
