import 'package:flutter/material.dart';
import 'package:viva2/contact_home/add_Screen.dart';
import 'package:viva2/contact_home/contact_call.dart';
import 'package:viva2/contact_home/home_screen.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) =>Home_Screen(),
        "call":(context) => Call_Screen(),
        "add":(context) => Add_Screen(),
      },
    ),
  );
}