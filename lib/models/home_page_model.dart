import 'dart:convert';

List<HomepageModel> homepageModelFromJson(String str) =>
    List<HomepageModel>.from(
        json.decode(str).map((x) => HomepageModel.fromJson(x)));

String homepageModelToJson(List<HomepageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomepageModel {
  HomepageModel({
    required this.title,
    required this.subPaths,
    required this.id,
    // required this.abcd,
    // required this.phone,
    // required this.countryCode,
    // required this.type,
    // required this.email,
    // required this.password,
    // required this.name,
  });

  String title;
  dynamic subPaths;
  String id;
  // String abcd;
  // String phone;
  // String countryCode;
  // String type;
  // String email;
  // String password;
  // String name;

  factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        title: json["title"],
        subPaths: json["sub_paths"],
        id: json["id"],
        // abcd: json["abcd"] == null ? null : json["abcd"],
        // phone: json["phone"] == null ? null : json["phone"],
        // countryCode: json["countryCode"] == null ? null : json["countryCode"],
        // type: json["type"] == null ? null : json["type"],
        // email: json["email"] == null ? null : json["email"],
        // password: json["password"] == null ? null : json["password"],
        // name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sub_paths": subPaths,
        "id": id,
        // "abcd": abcd == null ? null : abcd,
        // "phone": phone == null ? null : phone,
        // "countryCode": countryCode == null ? null : countryCode,
        // "type": type == null ? null : type,
        // "email": email == null ? null : email,
        // "password": password == null ? null : password,
        // "name": name == null ? null : name,
      };
}

class SubPath {
  SubPath({
    required this.id,
    required this.title,
    required this.image,
  });

  String id;
  String title;
  String image;

  factory SubPath.fromJson(Map<String, dynamic> json) => SubPath(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
