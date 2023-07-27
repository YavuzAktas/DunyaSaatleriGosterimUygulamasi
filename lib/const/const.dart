import 'package:flutter/cupertino.dart';

String baseUrl = 'http://worldtimeapi.org/api/timezone/';

enum IconConstants {
  header('header'),
  header2('header2'),
  day('day'),
  night('night');

  final String value;
  // ignore: sort_constructors_first
  const IconConstants(this.value);

  String get toPng => 'assets/icons/$value.png';
  Image get toImage => Image.asset(toPng);
  ImageIcon get toIcon => ImageIcon(AssetImage(toPng));
}
