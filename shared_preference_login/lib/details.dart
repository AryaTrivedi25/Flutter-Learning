// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

List<Details> detailsFromJson(String str) => List<Details>.from(json.decode(str).map((x) => Details.fromJson(x)));

String detailsToJson(List<Details> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Details {
  String name;
  String email;
  String pass;
  String desig;
  String mo;

  Details({
    required this.name,
    required this.email,
    required this.pass,
    required this.desig,
    required this.mo,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    name: json["name"],
    email: json["email"],
    pass: json["pass"],
    desig: json["desig"],
    mo: json["mo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "pass": pass,
    "desig": desig,
    "mo": mo,
  };
}
