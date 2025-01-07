import 'package:flutter/material.dart';
import 'package:notifytuneplus/model/Roommodel.dart';

class Roomtabs extends StatelessWidget {
  Roomtabs({super.key});

  final List<Roommodel> rooms = [
    Roommodel(name: "Plus", host: "Neza Hakim", status: "live", tags: ["#education", "#sport"]),
    Roommodel(name: "Coders", host: "Ngabo Daniel", status: "live", tags: ["#programming", "#flutter"]),
    Roommodel(name: "Fashions", host: "Mideliestg", status: "upcoming", tags: ["#fashion", "#drip"]),
    Roommodel(name: "Sports", host: "Lionel Messi", status: "live", tags: ["#football", "#score"]),
    Roommodel(name: "Hotel", host: "Chef Enock", status: "upcoming", tags: ["#hotel", "#foods"]),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: [
          const SizedBox(height: 20),
          const TabBar(
            labelColor: Colors.blue, // Active tab label color
            unselectedLabelColor: Colors.grey, // Inactive tab label color
            indicatorColor: Colors.blue, // Line below active tab
            tabs: [
              Tab(text: "All"),
              Tab(text: "Live now"),
              Tab(text: "Upcoming"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // All rooms
                ListView(
                  children: rooms.map((room) {
                    return _buildRoomCard(room);
                  }).toList(),
                ),
                // Live rooms
                ListView(
                  children: rooms
                      .where((room) => room.status == "live")
                      .map((room) {
                    return _buildRoomCard(room);
                  }).toList(),
                ),
                // Upcoming rooms
                ListView(
                  children: rooms
                      .where((room) => room.status == "upcoming")
                      .map((room) {
                    return _buildRoomCard(room);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the room card
  Widget _buildRoomCard(Roommodel room) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 29, 9, 77)),
            child: Row(
              children: [
                Icon(Icons.group),
                SizedBox(width: 20),
                Text(room.name, style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Text(room.status,
                      style: TextStyle(
                          color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text("hosted by "),
               Expanded(
      child: Text(room.host),
    ),
              SizedBox(width: 10),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text("Join", style: TextStyle(color: Colors.white)),
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 20),
          // Display tags
          Wrap(
            children: room.tags.map((tag) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tag)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
