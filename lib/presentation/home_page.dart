import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_apps/bloc/cart.dart';
import 'package:login_apps/components/card_profile.dart';
import 'package:login_apps/components/discover_list_item.dart';
import 'package:login_apps/components/modal/bottom_modal_item.dart';
import 'package:login_apps/components/rating_bar.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = BlocProvider.of<CartProvider>(context);

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.list, size: 33),
                  BlocBuilder(
                      bloc: cartProvider,
                      builder: (context, state) {
                        return badges.Badge(
                            child: Icon(Icons.shopping_cart),
                            badgeContent: Text('${(state as List).length}'),
                            badgeAnimation: badges.BadgeAnimation.fade());
                      })
                ],
              ),
            ),
            const CardProfile(),
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
              const TitleListView(
                title: "Must Try",
                subTitle: "Based on the popularity of articles",
              ),
              DiscoverListItem()
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleListView(
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
