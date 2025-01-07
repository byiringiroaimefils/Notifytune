import 'package:flutter/material.dart';
import 'package:notifytuneplus/pages/People.dart';
import 'package:notifytuneplus/pages/Rooms.dart';


class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.group), text: "Rooms"),
              Tab(icon: Icon(Icons.person), text: "People"),
            ],
          ),
          Expanded(
            // Wrap TabBarView in Expanded for proper layout
            child: TabBarView(
              children: [
                Rooms(),
                People(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
