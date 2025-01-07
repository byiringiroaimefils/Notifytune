import 'package:flutter/material.dart';
import "package:notifytuneplus/pages/Tabs.dart";

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.black12,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search people or rooms...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between the search bar and tabs
                Container(
                  height: MediaQuery.of(context).size.height * 0.8, // Adjust height dynamically
                  child: const Tabs(), // Tabs widget
                ),
              ],
            ),
          ),
        ),
      ));
  }
}