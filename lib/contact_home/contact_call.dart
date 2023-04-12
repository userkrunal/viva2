import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viva2/contact_home/home_screen.dart';

class Call_Screen extends StatefulWidget {
  const Call_Screen({Key? key}) : super(key: key);

  @override
  State<Call_Screen> createState() => _Call_ScreenState();
}

class _Call_ScreenState extends State<Call_Screen> {
  ContacModel cm=ContacModel();
  String? path;
  @override
  Widget build(BuildContext context) {
   int i= ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(child: Scaffold(
      body: Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            ElevatedButton(onPressed: () async {
              ImagePicker imagePicker=ImagePicker();
              XFile? xfile =await imagePicker.pickImage(source: ImageSource.camera);
              setState(() {
                path=xfile!.path;
              });
            }, child: Icon(Icons.camera)),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 340,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("${l1[i].name}",style: TextStyle(fontSize: 30,color: Colors.blue)),
                      ],),
                    ),
                    SizedBox(height: 10),

                  ],
                ),
              ),
            CircleAvatar(backgroundImage:FileImage(File("${path}")),
              radius: 50,
            ),
          ],)
        ],
      ),
    ));
  }
}
