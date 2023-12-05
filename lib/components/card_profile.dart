import 'package:flutter/material.dart';
import 'package:login_apps/components/profile_information_text.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          const BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 160,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/profile-photo.jpg",
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ))),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Elliot',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  "Associatoe Editor",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InformationText(title: 'Orders', text: '44'),
                                  InformationText(
                                      title: 'Followers', text: '120'),
                                ],
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
          Flexible(
              child: Container(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'accept',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'cancel',
                        style: TextStyle(color: Colors.black26),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
