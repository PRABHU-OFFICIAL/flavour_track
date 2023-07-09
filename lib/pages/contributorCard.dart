import 'package:flutter/material.dart';

class CardContributor extends StatelessWidget {
  final String name;
  final String image;
  final String contribution;
  final String imageLink;
  const CardContributor(
      {super.key,
      required this.name,
      required this.image,
      required this.contribution,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      shadowColor: Colors.blue,
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Container(
              height: 90,
              width: 200,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(contribution),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up_sharp,
                              color: Colors.pink,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "2.5k",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.thumb_down,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "23",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(imageLink),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
