import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viva2/contact_home/home_screen.dart';

class Call_Screen extends StatefulWidget {
  const Call_Screen({Key? key}) : super(key: key);

  @override
  State<Call_Screen> createState() => _Call_ScreenState();
}

class _Call_ScreenState extends State<Call_Screen> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtMobil=TextEditingController();
  ContacModel cm=ContacModel();
  String? path;
  @override
  Widget build(BuildContext context) {
   int i= ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(child: Scaffold(
      body:Stack(
        children:[

          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
            child: Container(
              height: double.infinity,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new,color: Colors.blue.shade500),
                    Text("Contacts",style: TextStyle(fontSize: 30,color: Colors.blue.shade500),),
                    Icon(Icons.edit_square,size: 30,color: Colors.blue.shade500),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${l1[i].name}",style: TextStyle(fontSize: 30,color: Colors.blue.shade500)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("${l1[i].mobile}",style: TextStyle(fontSize: 15,color: Colors.blue.shade500)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: () {
                            setState(() {
                              l1.removeAt(i);
                              Navigator.pop(context);
                            });
                          }, icon: Icon(Icons.delete,color: Colors.blue.shade500,size: 30,)),
                          IconButton(onPressed: () {
                            txtName=TextEditingController(text: cm.name);
                            txtMobil=TextEditingController(text: cm.mobile);
                            updetDialog(i);
                          }, icon: Icon(Icons.edit,color: Colors.blue.shade500,size: 30)),
                          IconButton(onPressed: () async {
                            String link="tel:${l1[i].mobile}";
                            await launchUrl(Uri.parse(link));
                          }, icon: Icon(Icons.call,color: Colors.blue.shade500,size: 30)),
                          IconButton(onPressed: ()  {
                            Share.share("${l1[i].name}");
                          }, icon: Icon(Icons.share,color: Colors.blue.shade500,size: 30)),
                          IconButton(onPressed: ()  async {
                            String link="sms:${l1[i].mobile}?body=Thank You";
                            await launchUrl(Uri.parse(link));
                          }, icon: Icon(Icons.message,color: Colors.blue.shade500,size: 30)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundImage: AssetImage("${l1[i].image}"),radius: 70),
              ],
            ),
          ),
      ],
      ),
    ));
  }
  void updetDialog(int i)
  {
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: txtName,decoration: InputDecoration(
                labelText: "${l1[i].name}",
              ),),
              TextField(controller: txtMobil,decoration: InputDecoration(
                labelText: "${l1[i].mobile}",
              ),),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                String newName=txtName.text;
                String newContact=txtMobil.text;
                setState(() {
                  l1[i]=ContacModel(name: newName,mobile: newContact);
                });
                Navigator.pop(context);
              }, child: Text("Update"))
            ],
          ),
        );
      },);
  }
}
