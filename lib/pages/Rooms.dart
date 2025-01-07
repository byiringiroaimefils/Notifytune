import 'package:flutter/material.dart';
import 'package:notifytuneplus/pages/Roomtabs.dart';
import 'package:notifytuneplus/pages/Tags.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),child: 
    Column(
      children: [
        Tags(),
        Expanded(child: Roomtabs()),
        
      ],
    )
    ,);
  }
}