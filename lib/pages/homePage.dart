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
    return Scaffold(
      // floating Actions Part
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        child: const Icon(
          Icons.health_and_safety_outlined,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // Body Part
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Text(
                  "Hello",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                ),
                const Text(
                  " Prabhu !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 2),
                itemCount: items.length,
                itemBuilder: (context, int index) => Card(
                      elevation: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[index].itemName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                      fontSize: 18),
                                ),
                                Text(
                                  items[index].count,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              items[index].icon,
                              color: items[index].color,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    )),
          ))
        ],
      )),

      // Bottom Navigation Part
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Account"),
        ],
        onTap: getCurrentIndex,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.pink,
      ),
    );
  }
}

class CardItems {
  late String itemName = "";
  late String count = "";
  late IconData? icon = Icons.ac_unit;
  late Color? color = Colors.black;

  CardItems(this.itemName, this.count, this.icon, this.color) {}
}
