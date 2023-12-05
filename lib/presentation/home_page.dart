import 'package:flutter/material.dart';
import 'package:login_apps/components/card_profile.dart';
import 'package:login_apps/components/discover_list_item.dart';
import 'package:login_apps/components/rating_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CardProfile(),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0))),
                      builder: (context) {
                        return SizedBox(
                          height: 400,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/food-2.jpeg',
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: double.infinity,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Fried Rice",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RatingBar(
                                      size: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Most Popular food in the world,Most Popular food in the world Most Popular food in the world",
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow[800],
                                      ),
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text('click')),
            renderDiscoverable(),
            const CardFeatured()
          ],
        ),
      ),
    ));
  }

  Widget renderDiscoverable() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleListView(
                title: "Must Try",
                subTitle: "Based on the popularity of articles",
              ),
              DiscoverListItem()
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleListView(
                title: "New release",
                subTitle: "Discover new release",
              ),
              DiscoverListItem()
            ],
          )
        ],
      ),
    );
  }
}

class CardFeatured extends StatelessWidget {
  const CardFeatured({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 118, 160, 155),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 70, 95, 92),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "Featured Article",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Natural mood regulation lower absent in people with depress",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )
          ]),
    );
  }
}

class TitleListView extends StatelessWidget {
  const TitleListView({Key? key, required this.subTitle, required this.title})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color.fromARGB(255, 19, 16, 16)),
          ),
          Text(
            subTitle,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          )
        ],
      ),
    );
  }
}
