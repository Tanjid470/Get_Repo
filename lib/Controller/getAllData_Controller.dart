import 'dart:convert';
import 'package:git_repo/Model/getData.dart';
import 'package:http/http.dart' as http;


class API {
  List<GetAllData> personsDataList = [];
  Future<List<GetAllData>> getData_FromApi() async {
    final response =
        await http.get(Uri.parse('https://api.github.com/repos/eddiejaoude/eddiejaoude/issues'));
    var decodedDatalist = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in decodedDatalist) {
        personsDataList.add(GetAllData.fromJson(i));
      }
      return personsDataList;
    } else {
      return personsDataList;
    }
  }
}
