import 'package:flutter/material.dart';

class MyListItems {
  late String title = "";
  late IconData? miniIcon = Icons.tag_faces_rounded;
  late String subTitle = "";

  MyListItems(this.miniIcon, this.title, this.subTitle);
}

List<MyListItems> items = [
  MyListItems(Icons.book, "Prakash", "Donated 25 meals"),
  MyListItems(Icons.woman, "Prabhu", "Helped 124 people"),
  MyListItems(Icons.attach_money_rounded, "Sakshi", "Raised 2.5k funds"),
  MyListItems(Icons.woman, "Lisa", "Supported 25 families"),
  MyListItems(Icons.fastfood, "Hima", "Served 230 meals"),
];

class CustomListTileItems extends StatefulWidget {
  const CustomListTileItems({Key? key}) : super(key: key);

  @override
  _CustomListTileItemsState createState() => _CustomListTileItemsState();
}

class _CustomListTileItemsState extends State<CustomListTileItems> {
  List<MyListItems> filteredItems = [];

  @override
  void initState() {
    filteredItems = List.from(items);
    super.initState();
  }

  void _searchItems(String value) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item.title.toLowerCase().contains(value.toLowerCase()) ||
              item.subTitle.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: _searchItems,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                hintText: "Search your contributions",
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                    child: Icon(
                      filteredItems[index].miniIcon,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    filteredItems[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    filteredItems[index].subTitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey[600],
                    size: 30.0,
                  ),
                  onTap: () {
                    // Handle item tap
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
