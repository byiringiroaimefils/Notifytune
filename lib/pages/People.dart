import 'package:flutter/material.dart';
import 'package:notifytuneplus/model/Personmodel.dart';

class People extends StatelessWidget {
  final List<Person> people = [
    Person(name: "Ngabo", location: "Rubavu, Rugerero", gender: "Male"),
    Person(name: "Thierry", location: "Kigali, Rwanda", gender: "Male"),
    Person(name: "Agnes", location: "Nairobi, Kenya", gender: "Female"),
    Person(name: "Irene", location: "Ottawa, Canada", gender: "Female"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: people.map((person) => _PersonCard(person)).toList(),
    );
  }

  Widget _PersonCard(Person person) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section with name and Live status
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF1D094D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.person, color: Color(0xFF1D094D)),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    person.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Live",
                    style: TextStyle(
                      color: Color(0xFF1D094D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Middle section with location and gender
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  person.location,
                  style: TextStyle(color: Colors.black54),
                ),
                Spacer(),
                Icon(Icons.male, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  person.gender,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),

          // Bottom section with Invite button and hashtags
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D094D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Invite"),
                ),
                Row(
                  children: [
                    Text(
                      "#NezaAi",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "#ChatGpt",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
