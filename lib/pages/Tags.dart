import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});
  Widget tags(name){
    return    Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.blueAccent, // Add background color here
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0), // Add padding here
    child: Text(
      "#$name",
      style: const TextStyle(color: Colors.white),
    ),
  ),
);
  }

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        Text("Trending tags",style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tags("musics"),
            tags("entertainment"),
            tags("cooking"),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tags("sport"),
            tags("education"),
            tags("technology"),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tags("ai"),
            tags("culture"),
            tags("socialmedia"),
          ],
        ),
      ],
    );
  }
}