import 'package:flutter/material.dart';
import 'package:notifytuneplus/pages/chats_page.dart';
import 'package:notifytuneplus/pages/home_content.dart';
import 'package:notifytuneplus/pages/notifications_page.dart';
import 'package:notifytuneplus/pages/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int currentindex = 0;

  final List<Widget> screens = [
    const HomeContent(),
    const ChatsPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
          title: const Text(
            "NotifyTune+",
            style: TextStyle(
              color: Color.fromARGB(255, 1, 1, 53),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: screens[currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          selectedItemColor: Colors.blue, // Color for selected icon and label
          unselectedItemColor: Colors.grey, // Color for unselected icon and label
          selectedLabelStyle: const TextStyle(
            color: Colors.blue, // Explicitly set selected label color
            fontWeight: FontWeight.bold, // Style for selected labels
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey, // Explicitly set unselected label color
            fontWeight: FontWeight.normal, // Style for unselected labels
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
