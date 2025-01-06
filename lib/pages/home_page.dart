import 'package:flutter/material.dart';
import 'package:notifytuneplus/components/mybutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchcontroller = TextEditingController();

  int _currentIndex = 0; 
  String _selectedContent = "Rooms";

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Define the route based on the selected tab
    String route;
    switch (index) {
      case 0:
        route = "/homepage";
        break;
      case 1:
        route = "/chats";
        break;
      case 2:
        route = "/notifications";
        break;
      case 3:
        route = "/profile";
        break;
      default:
        return;
    }

    // Navigate only if it's a different route
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  void _updateContent(String content) {
    setState(() {
      _selectedContent = content;
    });
  }

  Widget _buildRoomsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Active/Live Rooms",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 2, 
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(Icons.meeting_room, color: Colors.teal),
                  title: Text("Room ${index + 1}"),
                  subtitle: Text("Active Participants: ${10 + index}"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle room card click
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPeopleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "People",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 2, 
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      "P${index + 1}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text("Person ${index + 1}"),
                  subtitle: Text("Status: Online"),
                  trailing: Icon(Icons.chat),
                  onTap: () {
                    // Handle person card click
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notify Tune +",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal[900],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchcontroller,
                    decoration: InputDecoration(
                      filled: true, // Enable background color
                      fillColor: Colors.grey[200], 
                      hintText: "Search...",
                      hintStyle: TextStyle(
                          color: Colors.grey[600]),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[600],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                        borderSide: BorderSide.none, 
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyButton(
                  onPressed: () => _updateContent("Rooms"),
                  text: "Rooms",
                ),
                MyButton(
                  onPressed: () => _updateContent("People"),
                  text: "People",
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _selectedContent == "Rooms"
                  ? _buildRoomsContent()
                  : _buildPeopleContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.teal[900], // Highlight color for active tab
        unselectedItemColor: Colors.grey[600], // Color for inactive tabs
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        backgroundColor: Colors.white, // Background color of the bar
        type: BottomNavigationBarType.fixed, // Fixed icons and labels
        elevation: 10,
      ),
    );
  }
}
