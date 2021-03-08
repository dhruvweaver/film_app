import 'package:flutter/foundation.dart';

import './image.dart';

class Roll {
  final String id;
  final String title;
  final String filmStock;
  final int iso;
  final String filmSize;
  int totalImages = 0;
  List<Image> photos;

  Roll({
    @required this.id,
    @required this.title,
    @required this.filmStock,
    @required this.iso,
    @required this.filmSize,
    @required this.photos,
  });
}
