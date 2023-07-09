import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "My",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(
                  " Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.pink),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Prabhu",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Contributions: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "35",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 20,
                              ),
                              Text(
                                "Verified",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up_sharp,
                                size: 20,
                                color: Colors.pink,
                              ),
                              Text(
                                " 2.5k",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.thumb_down_sharp,
                                size: 20,
                                color: Colors.blue,
                              ),
                              Text(
                                " 12",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  buildListTile(Icons.person, 'Profile', Colors.blue, () {
                    // Handle profile settings
                  }),
                  buildDivider(),
                  buildListTile(Icons.lock, 'Privacy', Colors.green, () {
                    // Handle privacy settings
                  }),
                  buildDivider(),
                  buildListTile(
                      Icons.notifications, 'Notifications', Colors.orange, () {
                    // Handle notification settings
                  }),
                  buildDivider(),
                  buildListTile(Icons.palette, 'Appearance', Colors.pink, () {
                    // Handle appearance settings
                  }),
                  buildDivider(),
                  buildListTile(Icons.help, 'Help & Support', Colors.teal, () {
                    // Handle help and support settings
                  }),
                  buildDivider(),
                  buildListTile(Icons.exit_to_app, 'Logout', Colors.red, () {
                    // Handle logout action
                  }),
                  buildDivider(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildListTile(
      IconData icon, String title, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: color, // Customizing the icon color
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87, // Customizing the text color
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey, // Customizing the trailing arrow icon color
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      indent: 72,
      thickness: 1,
      height: 0,
      color: Colors.grey.withOpacity(0.5), // Customizing the divider color
    );
  }
}
