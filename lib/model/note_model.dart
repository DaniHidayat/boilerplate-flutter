class NoteModel {
  List<Note>? data;

  NoteModel({this.data});

  NoteModel.fromJson(Map<String, dynamic> json) {
   
    if (json['data'] != null) {
       print('daniada: ${json['data']}');
    data = <Note>[];
    json['data'].forEach((v) {
      data?.add(Note.fromJson(v));
    });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Note {
  String? noteId;
  String? title;
  String? content;

  Note({
    this.noteId,
    this.title,
    this.content,
  });

  Note.fromJson(Map<String, dynamic> json) {
    print('macko: ${json}');
    noteId = json['_id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.noteId;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
