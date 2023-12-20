import 'package:arbiter_pm/constants/text_logs.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

double total = 0;

double value = 0;

int serviceIndex = 0;

int selectedIndex = 0;

const double kDefaultPadding = 20.0;

const Duration hoverAnimationDuration =  Duration(milliseconds: 200);

const Duration toggleButtonAnimationDuration = Duration(milliseconds: 200);

const Duration magnetMouseAnimationDuration = Duration(milliseconds: 400);

const Duration drawerAnimationDuration = Duration(milliseconds: 500);

const Duration scrollAnimationDuration = Duration(seconds: 1);

const Duration snackbarDuration = Duration(seconds: 5);

const Duration carouselAnimDuration = Duration(milliseconds: 600);

const Curve slidingAnimationCurve = Curves.fastLinearToSlowEaseIn;

const Curve drawerAnimationCurve = Curves.easeInExpo;

const Curve cardAnimationCurve = Curves.easeOutCubic;

const Curve toggleButtonAnimationCurve = Curves.easeInOutBack;

const Curve buttonAnimationCurve = Curves.fastLinearToSlowEaseIn;

const Curve scrollAnimationCurve = Curves.easeInOut;

void launchURLs(String url) async {
  final Uri uri = Uri.parse(url);

  await canLaunchUrl(uri)
      ? await launchUrl(uri)
      : throw 'Could not launch $url';
}

void sendEmail(String sendEmailTo, String subject, String emailBody) async {
  // convert uint8list to base 64
  //final enc = screenshot!;

  final mailAdmin = FirebaseFirestore.instance.collection('mail');
  await mailAdmin.doc().set({
    'to': sendEmailTo,
    'message': {
      'subject': subject,
      //'text': emailBody,
      'html': emailBody
    }
  });
}

void launchEmailUrl() async {
  final String query =
      'mailto:$myEmail?subject=${(Uri.encodeComponent(emailSubject))}&body=${(Uri.encodeComponent(body))}';

  await canLaunchUrl(Uri.parse(query))
      ? await launchUrl(Uri.parse(query))
      : throw Get.snackbar(Uri.parse(query).toString(),
          '- 🤖🤖🤖🤖 --***--- Could not launch Email $query --  🤖🤖🤖🤖 --',
          duration: snackbarDuration);
}

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 10),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(.1),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(.1),
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: kDarker,
    width: 1.5,
  ),
);
