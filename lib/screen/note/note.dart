import 'package:boilerplateflutter/component/loader.dart';
import 'package:boilerplateflutter/controller/maincontroller.dart';
import 'package:boilerplateflutter/skelaton/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../services/base.dart';
import '../../skelaton/noteSkelaton.dart';
import 'add.dart';
import 'edit.dart';
import 'package:boilerplateflutter/model/note_model.dart';
class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
    final mainC = Get.find<MainController>();
  var isloading = false.obs;
  List _get = [];

  final _lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100
  ];

  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(milliseconds: 10), () {
      mainC.getNotes();
    });
   
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Note List'),
    ),
    body: Obx(() {
      if (mainC.isLoading.value) {
         print("Loading");
        // Tampilkan indikator loading jika isLoading bernilai true
        // return Center(child: CircularProgressIndicator());
        return NoteSkelaton();
      } else {
        if (mainC.listNotes.isEmpty) {
          print("Kosong");
          // Tampilkan pesan "No Data Available" jika listNotes kosong
          return Center(
            child: Text(
              "No Data Available",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {

        
          // Tampilkan MasonryGridView jika listNotes tidak kosong
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: mainC.listNotes.length,
            itemBuilder: (context, index) {
              Note note = mainC.listNotes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit(id: note.noteId.toString()),
                    ),
                  );
                },
                child: 
               Card(
                  color: _lightColors[index % _lightColors.length],
                  child: Container(
                    constraints: BoxConstraints(minHeight: (index % 2 + 1) * 85),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${note.title}',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${note.content}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }
    }),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Add()),
        );
      },
    ),
  );
}

}
