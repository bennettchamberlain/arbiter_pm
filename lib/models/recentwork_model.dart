import 'package:flutter/material.dart';

import '../constants/image_paths.dart';
import '../constants/text_logs.dart';
import '../constants/text_styles.dart';

class RecentWork {
  final String title, image, category;
  final int id;

  RecentWork({
    required this.category,
    required this.id,
    required this.image,
    required this.title,
  });
}

class RecentWorkDetails {
  final String title;
  final String? platform;
  final String? image;
  final String? video;
  Widget description;
  final int id;
  RecentWorkDetails(
      {required this.title,
      required this.id,
      required this.image,
      this.video,
      required this.platform,
      required this.description});
}

List<RecentWork> recentWorks = [
  //TODO: recent works
  RecentWork(
    id: 1,
    title: recentWorksText1,
    category: 'Webbed Feet Radio Website',
    image: recentWorksPic1,
  ),
  RecentWork(
    id: 2,
    title: recentWorksText2,
    category: 'Western Belting Innovations Website',
    image: recentWorksPic2,
  ),
  RecentWork(
    id: 3,
    title: recentWorksText3,
    category: 'Smart QR Ticketing System',
    image: recentWorksPic3,
  ),
  RecentWork(
    id: 4,
    title: recentWorksText4,
    category: 'Mr Brainwash Paints',
    image: recentWorksPic4,
  ),
];

List<RecentWorkDetails> recentWorksDetails = [
  RecentWorkDetails(
    title: 'Webbed Feet Radio Website',
    id: 1,
    image: recentWorksPic1,
    platform: "NextJS and React",
    description: const Text(
        "Interactive web of artists and episode archive for Montreal based radio show",
        style: feedbackCardNameTextStyle),
  ),
  RecentWorkDetails(
    title: 'Western Belting Innovations Website',
    id: 2,
    image: recentWorksPic2,
    platform: "Wordpress with Custom PHP",
    description: const Text(
        "Conveyor belt manufacturing company website servicing the food industry",
        style: feedbackCardNameTextStyle),
  ),
  RecentWorkDetails(
    title: 'Smart QR Ticketing System',
    id: 3,
    image: recentWorksPic3,
    platform: "Flutter Web App",
    description: const Text(
        "Working under the artistic tutelage of Thierry Guetta, better known as Mr Brainwash, the producer and artist behind the Banksy-directed and Academy Award winning documentary, \"Exit Through the Giftshop\", I was able to realize Thierry's vision of a custom ticketing platform with unique analytics capabilities for use at The Mr. Brainwash Art Museum. Located at the Paley Center for the Arts in Beverly Hills, Thierry's art museum is a temporary pop art attraction open for an indefinite period before the Paley Center is redeveloped into a mixed use real estate project. The ticketing platform, a Flutter Web app using a noSQL database (NoSQL is ideal for horizontal scaling and apps that don't necessitate querying nested relational tables), allowed for users to register for tickets and take automatic delivery via email of a unique QR code ticket. At the museum doors, ticket attendants had the ability to scan tickets with the web app using administrator credentials to determine validity of customer tickets. The QR code tickets were identified and scanned using Google's machine learning kit API",
        style: feedbackCardNameTextStyle),
  ),
  RecentWorkDetails(
    title: 'Mr Brainwash Paints iPad App',
    id: 4,
    image: recentWorksPic4,
    platform: "Flutter",
    description: const Text(
        "Using flutter for iOS, Arbiter designed and developed an iPad app similar to photoshop or canva that allowed users to create layers of paint, images, splats, working stencils, Text, and more. With features like in-app saving, sharing, and process art video playpack for social media, the project was a massive success.",
        style: feedbackCardNameTextStyle),
  ),
];
