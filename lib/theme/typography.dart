import 'package:flutter/widgets.dart';

abstract class AppText {
  //headings
  TextStyle h1 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle h2 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  //body
  TextStyle b1 = TextStyle(fontSize: 16);
  TextStyle b2 = TextStyle(fontSize: 14);
  TextStyle b3 = TextStyle(fontSize: 12);

  //labels
  TextStyle l1 = TextStyle(fontSize: 10);
  TextStyle l2 = TextStyle(fontSize: 8);
}
