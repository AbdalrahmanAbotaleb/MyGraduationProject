import 'dart:convert';

class Categories {
  List<Datum> data;

  Categories({
    required this.data,
  });

  Categories copyWith({
    List<Datum>? data,
  }) =>
      Categories(
        data: data ?? this.data,
      );

  factory Categories.fromJson(String str) => Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  String name;
  int id;

  Datum({
    required this.name,
    required this.id,
  });

  Datum copyWith({
    String? name,
    int? id,
  }) =>
      Datum(
        name: name ?? this.name,
        id: id ?? this.id,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
  };
}
