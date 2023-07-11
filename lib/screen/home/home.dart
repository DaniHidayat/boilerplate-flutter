import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  dynamic title;
 Home(
    this.title, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
return MaterialApp(
    debugShowCheckedModeBanner:false,
      home: Scaffold(appBar: AppBar(
        
        title: Text('Dani'),
      
      ),
      body: Center(child: Text("Halaman Home ${title}")),),
    );
  }
}