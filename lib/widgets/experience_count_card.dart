import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';

class ExperienceCountCard extends StatelessWidget {
  const ExperienceCountCard({
    Key? key,
    required this.expNum,
  }) : super(key: key);

  final String expNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 255,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: const Color(0xFFD8DBE2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: const Color(0xFF3A015C),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 6,
                color: const Color(0xFF3A015C).withOpacity(.25),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  expNum,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = const Color(0xFF3A015C).withOpacity(.5),
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: const Color(0xFFD8DBE2).withOpacity(.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  expNum,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: whitebackgroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding * .5,
            ),
            const Text(
              'Years of Experience',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
