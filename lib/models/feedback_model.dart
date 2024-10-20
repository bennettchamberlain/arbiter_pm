import 'package:flutter/material.dart';

import '../constants/image_paths.dart';
import '../constants/text_logs.dart';

class Feedback {
  final String name, review, userPic;
  final int id;
  final Color color;

  Feedback(
    this.name,
    this.review,
    this.userPic,
    this.id,
    this.color,
  );
}

List<Feedback> feedBacks = [
  //TODO: feedbacks
  Feedback(
    'Thierry Guetta',
    feedbackText2,
    thierry,
    1,
    const Color(0xFFFFF3DD),
  ),
  Feedback(
    'Webbed Feet Radio',
    feedbackText3,
    wf,
    2,
    const Color(0xFFD9FFFC),
  ),
  Feedback(
    'WBI Inc.',
    feedbackText,
    wbi,
    3,
    const Color(0xFFFFE0E0),
  ),
];
