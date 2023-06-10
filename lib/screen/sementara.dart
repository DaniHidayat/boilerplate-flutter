import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sementara extends StatelessWidget {
  const Sementara({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('Dani'),),
      body: Center(child: Text("Halaman awal ")),),
    );
  }
}