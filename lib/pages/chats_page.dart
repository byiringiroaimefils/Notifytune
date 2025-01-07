import "package:flutter/material.dart";
import "package:notifytuneplus/components/messagetile.dart";
import "package:notifytuneplus/components/mybutton.dart";

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final TextEditingController _chatsearchcontroller = TextEditingController();
  // Widget _buildPersonalContent() {
  //   return Column(
  //     children: [
  //       Text(
  //         "Personal",
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 10),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: 2, 
  //           itemBuilder: (context, index) {
  //             return Card(
  //               margin: EdgeInsets.symmetric(vertical: 8),
  //               child: ListTile(
  //                 leading: CircleAvatar(
  //                   backgroundColor: Colors.teal,
  //                   child: Text(
  //                     "P${index + 1}",
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //                 title: Text("Person ${index + 1}"),
  //                 subtitle: Text("Status: Online"),
  //                 trailing: Icon(Icons.chat),
  //                 onTap: () {
  //                   // Handle person card click
  //                 },
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Notify Tune +",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
          ],
        ),
        elevation: 4,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chats",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    Icon(Icons.edit, color: Colors.teal[900]),
                    SizedBox(width: 15),
                    Icon(Icons.more_vert, color: Colors.grey[600]),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _chatsearchcontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Search chats...",
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                suffixIcon: _chatsearchcontroller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey[600]),
                        onPressed: () => _chatsearchcontroller.clear(),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyButton(onPressed: () {}, text: "All"),
                  MyButton(onPressed: () {}, text: "Personal"),
                  MyButton(onPressed: () {}, text: "Groups"),
                  MyButton(onPressed: () {}, text: "Favorites"),
                ]
                    .map((button) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: button,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  MessageTile(
                    icon: Icons.person,
                    username: 'Neza Hakim',
                    message: 'Se u tmrw dear devs!!',
                    time: "10:00 AM",
                    messagecount: 5,
                  ),
                  MessageTile(
                    icon: Icons.person,
                    username: 'Glory code',
                    message: 'Hello Guys!!',
                    time: "10:00 AM",
                    messagecount: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
