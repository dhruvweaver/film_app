import 'package:flutter/foundation.dart';

import './image.dart';

class Roll {
  final int id;
  final String title;
  final String stock;
  final int iso;
  final String filmSize;
  int totalImages = 0;
  List<Image> photos;

  Roll(
      {@required this.id,
      @required this.title,
      @required this.stock,
      @required this.iso,
      @required this.filmSize,
      this.totalImages,
      this.photos});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'stock': stock,
      'iso': iso,
      'filmSize': filmSize,
      'totalImages': totalImages,
    };
  }
}
