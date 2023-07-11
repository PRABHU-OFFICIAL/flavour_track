import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_track/pages/accountPage.dart';
import 'package:flavour_track/pages/bookDonationPage.dart';
import 'package:flavour_track/pages/clothesDonationPage.dart';
import 'package:flavour_track/pages/contributorCard.dart';
import 'package:flavour_track/pages/foodDonationPage.dart';
import 'package:flavour_track/pages/moneyDonationPage.dart';
import 'package:flavour_track/pages/supportPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  void getCurrentIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<CardItems> items = [
    CardItems("Books", "245.3k", Icons.book, Colors.red),
    CardItems("Clothes", "392.5k", Icons.woman, Colors.purple),
    CardItems("Food", "235.2k", Icons.fastfood, Colors.amberAccent),
    CardItems("Money", "758.7k", Icons.attach_money_rounded, Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Body Part
        body: selectedIndex == 0
            ? SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Hello ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "User",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Welcome to Flavour Track",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    childAspectRatio: 2),
                            itemCount: items.length,
                            itemBuilder: (context, int index) =>
                                GestureDetector(
                                  onTap: () {
                                    index == 0
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BookDonationPage()))
                                        : index == 1
                                            ? Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ClothesDonationPage()))
                                            : index == 2
                                                ? Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const FoodDonationPage()))
                                                : Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MoneyDonationPage()));
                                  },
                                  child: Card(
                                    elevation: 7,
                                    shadowColor: Colors.blue,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                items[index].itemName,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.pink,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                items[index].count,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        Colors.grey.shade500),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            items[index].icon,
                                            color: items[index].color,
                                            size: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Our ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Contributors",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: const [
                            CardContributor(
                                name: "Prabhu",
                                contribution: "Food Contribution",
                                image: "assets/image1.jpeg",
                                imageLink: "assets/dp.jpeg"),
                            SizedBox(
                              width: 20,
                            ),
                            CardContributor(
                                name: "Kuldip",
                                contribution: "Books Contribution",
                                image: "assets/image2.jpg",
                                imageLink: "assets/dp.jpeg"),
                            SizedBox(
                              width: 20,
                            ),
                            CardContributor(
                                name: "Sai",
                                contribution: "Clothes Contribution",
                                image: "assets/image3.jpg",
                                imageLink: "assets/dp.jpeg"),
                            SizedBox(
                              width: 20,
                            ),
                            CardContributor(
                                name: "Ritik",
                                contribution: "Money Contribution",
                                image: "assets/image4.jpg",
                                imageLink: "assets/dp.jpeg"),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Our",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " Provisions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/topGrowth.webp",
                            height: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 150,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Food Share",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.pink),
                                  ),
                                  Text(
                                    "Connecting different Communities together, Reducing Waste, and Feeding the Hungry",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 150,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nourishment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.pink),
                                  ),
                                  Text(
                                    "Together Empowering Change Through Valuable Contributions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/contributor.png",
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/resourceDrop.png",
                            height: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 150,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Resource Drop",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.pink),
                                  ),
                                  Text(
                                    "Locating Collection Points for Food Donations",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 150,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Support",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.pink),
                                  ),
                                  Text(
                                    "Aid Connect through Support and Assistance for Food Donations",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/customerSupport.png",
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              )
            : selectedIndex == 1
                ? const SupportPage()
                : selectedIndex == 2
                    ? const AccountPage()
                    : Container(),

        // Bottom Navigation Part
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.support), label: "Support"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Account"),
          ],
          onTap: getCurrentIndex,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.pink,
        ),
      ),
    );
  }
}

class CardItems {
  late String itemName = "";
  late String count = "";
  late IconData? icon = Icons.ac_unit;
  late Color? color = Colors.black;

  CardItems(this.itemName, this.count, this.icon, this.color);
}
