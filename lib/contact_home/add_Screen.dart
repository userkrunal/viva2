import 'package:flutter/material.dart';
import 'package:viva2/contact_home/home_screen.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({Key? key}) : super(key: key);

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtMobile=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Contact"),
            centerTitle: true,
            backgroundColor: Colors.cyan.shade50,
            elevation: 5,
          ),
          body: Column(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/user.png"),radius: 70),
              SizedBox(height: 20),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple.shade50,width: 2)
                  ),
                  label: Text("Name"),
                  hintText: "Name",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.purple.shade400,width: 1)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: txtMobile,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple.shade50,width: 2)
                  ),
                  label: Text("Contact No"),
                  hintText: "Number",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.purple.shade400,width: 1)),
                ),
              ),
              ElevatedButton(onPressed: () {
                String name=txtName.text;
                String contect=txtMobile.text;
                String images="assets/man1.png";
                ContacModel cm=ContacModel(name: name,mobile: contect);
                // contacModel contactmodel=contModel(name: name,mobile: contect,image: images);
                l1.add(cm);
                Navigator.pop(context);
              }, child: Text("Submit"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade200)),

            ],
          ),
        )
    );
  }
}
