import 'dart:convert';

List<String> temperaturesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));
