// To parse this JSON data, do
//
//     final myArtikel = myArtikelFromJson(jsonString);

import 'dart:convert';

class MyArtikel {
  MyArtikel({
    this.name,
    this.avatar,
    this.judul,
    this.desk,
    this.id,
  });

  String? name;
  String? avatar;
  String? judul;
  String? desk;
  String? id;

  factory MyArtikel.fromRawJson(String str) =>
      MyArtikel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyArtikel.fromJson(Map<String, dynamic> json) => MyArtikel(
        name: json["name"],
        avatar: json["avatar"],
        judul: json["judul"],
        desk: json["desk"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "judul": judul,
        "desk": desk,
        "id": id,
      };
}
