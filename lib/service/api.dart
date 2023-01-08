import 'dart:convert';

import 'package:reski_sample/model/my_artikel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<MyArtikel>> ambilData() async {
    final response = await http.get(
        Uri.parse('https://63baeb0032d17a5090815dfa.mockapi.io/blog/kominfo'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MyArtikel.fromJson(data)).toList();
    } else {
      throw Exception('Gagal Mendapatkan Data');
    }
  }

  Future postData(
    String uname,
    String uavatar,
    String udesk,
    String ujudul,
  ) async {
    final response = await http.post(
        Uri.parse('https://63baeb0032d17a5090815dfa.mockapi.io/blog/kominfo'),
        body: {
          'name': uname,
          'avatar': uavatar,
          'udesk': udesk,
          'ujudul': ujudul,
        });
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Gagal Menambahkab Data');
    }
  }
}
