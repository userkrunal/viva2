import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
ContacModel contacModel=ContacModel();
List l1=[
  ContacModel(name: "Anna Arletti",mobile: "+39 3280345089",image: "assets/woman.png"),
  ContacModel(name: "Alex Solleri",mobile: "+39 3450345089",image: "assets/man1.jpg"),
  ContacModel(name: "Archie Mellory",mobile: "+39 3270345055",image: "assets/man2.jpg"),
  ContacModel(name: "Allison Boals",mobile: "+44 3270345347",image: "assets/man.png"),
  ContacModel(name: "Alicia Halls",mobile: "+44 73280345089",image: "assets/man.png"),
  ContacModel(name: "Anna Arletti",mobile: "+39 3280345089",image: "assets/man3.png"),
];

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back,color: Colors.grey.shade500),actions: [Icon(Icons.more_vert_outlined,color: Colors.grey.shade500)],backgroundColor: Colors.white),

      body:Scrollbar(
        child: Stack(
          children:[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(width: 20),
               Text("MY CONTACT",style: TextStyle(color: Colors.grey.shade500)),
              ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  height: 50,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 3,blurRadius: 2)]
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.values[4],
                    children: [
                      Text("Type name or number",style: TextStyle(color: Colors.grey.shade300)),
                      Icon(Icons.search,color: Colors.grey.shade300),
                    ],
                  ) ,
                ),
              ],),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Text("A",style: TextStyle(fontSize: 30,color: Colors.blue),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140
              ),
              child: ListView.builder(itemBuilder:(context, index) => box(l1[index],index),itemCount: l1.length),
            ),

        ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add').then((value) {
            setState(() {

            });
          },);
        },child: Icon(Icons.add),
      ),
    ));
  }
  Widget box(ContacModel cm,index)
  {
    return Container(
      height: 70,
      width: 400,
      child: ListTile(
        title:Text("${cm.name}",style: TextStyle(color: Colors.blue),),
        subtitle: Text("${cm.mobile}",style: TextStyle(color: Colors.blue),),
        trailing:Icon(Icons.call,color: Colors.grey.shade500),
          leading: Container(height: 35,width: 35,child: Image.asset("${cm.image}")),
        onTap: () {
          Navigator.pushNamed(context, 'call',arguments: index);
        },
      ),
    );
  }
}
class ContacModel
{
  String? name,image,mobile;

  ContacModel({this.name, this.image, this.mobile});

}