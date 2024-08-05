// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/image_paths.dart';

class Service {
  final String title, image;
  final int id;
  final Color color;
  final List<String> description;

  Service(this.title, this.image, this.id, this.color, this.description);
}

List<Service> services = [
  Service('App Development', appDev, 1, const Color(0xFFcce6ff),
      ["We bring software ideas to life on iOS, Android, & Web"]),
  Service('Website Development', webDev, 2, const Color(0xFFfddeb2), [
    "From start to finish, we can build websites on any platform",
    //"Copywriting",
    //"Revisions & Support"
  ]),
  Service('UI-UX Design', uiUx, 3, const Color(0xFFefe3fe), [
    "We offer brand development, user research, \ncopywriting, and Web/App Design services",

    //"Application Wireframe"
  ]),
  Service('Cloud Services', cloud, 4, const Color(0xFFd3decc), [
    "Run your website or software from the cloud \nwithout the headache of maintenance or updates"
  ]),
];
