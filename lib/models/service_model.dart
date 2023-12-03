import 'package:flutter/material.dart';

import '../constants/image_paths.dart';

class Service {
  final String title, image;
  final int id;
  final Color color;

  Service(
    this.title,
    this.image,
    this.id,
    this.color,
  );
}

List<Service> services = [
  Service(
    'App Development',
    appDev,
    1,
    Color(0xFFcce6ff),
  ),
  Service(
    'Website Development',
    webDev,
    2,
    Color(0xFFfddeb2),
  ),
  Service(
    'UI-UX Design',
    uiUx,
    3,
    Color(0xFFefe3fe),
  ),
  Service(
    'Cloud Services',
    cloud,
    4,
    Color(0xFFd3decc),
  ),
];
