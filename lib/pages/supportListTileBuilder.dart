import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MyListItems {
  late String name;
  late String email;
  late String state;
  late String city;

  MyListItems(this.name, this.email, this.state, this.city);
}

class CustomListTileItems extends StatefulWidget {
  const CustomListTileItems({Key? key}) : super(key: key);

  @override
  _CustomListTileItemsState createState() => _CustomListTileItemsState();
}

class _CustomListTileItemsState extends State<CustomListTileItems> {
  List<MyListItems> items = [];
  List<MyListItems> filteredItems = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final db = await mongo.Db.create(
        "mongodb+srv://lituplayer:lll8117017978@cluster0.g186p7h.mongodb.net/?retryWrites=true&w=majority");
    await db.open();

    final collection = db.collection("ContributorsData");
    final result = await collection.find().toList();

    setState(() {
      items = result.map((document) {
        return MyListItems(
          document['name'] ?? '',
          document['email'] ?? '',
          document['state'] ?? '',
          document['city'] ?? '',
        );
      }).toList();
      filteredItems = List.from(items);
      isLoading = false;
    });

    await db.close();
  }

  void _searchItems(String value) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item.name.toLowerCase().contains(value.toLowerCase()) ||
              item.email.toLowerCase().contains(value.toLowerCase()) ||
              item.state.toLowerCase().contains(value.toLowerCase()) ||
              item.city.toLowerCase().contains(value.toLowerCase()))
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
                hintText: 'Search your contributions',
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(), // Show loading indicator
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        onTap: () {
                          // Handle item tap
                        },
                        title: Text(
                          filteredItems[index].name.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.pink),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredItems[index].email,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'State: ${filteredItems[index].state}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              'City: ${filteredItems[index].city}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.hail,
                          color: Colors.grey[600],
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
