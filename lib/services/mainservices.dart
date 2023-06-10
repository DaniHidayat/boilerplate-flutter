import 'dart:convert';
import 'package:boilerplateflutter/model/note_model.dart';
import 'package:boilerplateflutter/services/base.dart';
import 'package:http/http.dart' show Client;

class MainServices {
  Client client = Client();
  Future<NoteModel> getNotes() async {
    var url = Uri.parse(BaseUrl().getip() + '/notes');
    var response = await client.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return NoteModel.fromJson(res);
    } else {
      throw 'error';
    }
  }
}
