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
  Service('App Development', appDev, 1, Color(0xFFcce6ff),
      ["iOS, Android, & Web Apps", "Dapps", "Maintenance & Support"]),
  Service('Website Development', webDev, 2, Color(0xFFfddeb2), [
    "Any Platform",
    "SEO",
    "Digital Marketing",
    //"Copywriting",
    //"Revisions & Support"
  ]),
  Service('UI-UX Design', uiUx, 3, Color(0xFFefe3fe), [
    "Brand Development",
    "User Research",
    "Web/App Design",
    //"Application Wireframe"
  ]),
  Service('Cloud Services', cloud, 4, Color(0xFFd3decc),
      ["Google cloud", "Microsoft Azure", "Amazon Web Services"]),
];
