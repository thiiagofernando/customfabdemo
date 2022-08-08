import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  ScrollController controller = ScrollController();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(),
      floatingActionButton: CustomFab(customFabController: controller),
      body: ListView.builder(
        itemCount: 30,
        controller: controller,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Item $index"),
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(
                  255,
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                ),
              ),
            ),
          );
        },
      ),
    ),
  ));
}

class CustomFab extends StatefulWidget {
  const CustomFab({Key? key, required this.customFabController}) : super(key: key);
  final ScrollController customFabController;

  @override
  State<StatefulWidget> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  bool isVisibles = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      //visible: isVisibles,
      child: FloatingActionButton(
        child:isVisibles ? const Icon(Icons.phone): const Icon(Icons.phone_android_sharp),
        onPressed: () {},
      ),
    );
  }
  @override
  void initState() {
    widget.customFabController.addListener(() {
      if(widget.customFabController.position.userScrollDirection == ScrollDirection.reverse){
        if(isVisibles !=false){
          setState(() {
            isVisibles =false;
          });
        }
      }else{
        if(isVisibles != true){
          setState(() {
            isVisibles = true;
          });
        }
      }
    });
    super.initState();
  }
}
