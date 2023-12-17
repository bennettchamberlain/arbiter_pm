import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../constants/image_paths.dart';
import '../controllers/scrolling_controller.dart';

class ThemeToggleButton extends GetView<ThemeController> {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var scrollcontroller = Get.find<ScrollingController>();

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/invoice");
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "PAY INVOICE",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            selectedIndex = 5;

            Obx(scrollcontroller.scrollTo(context, selectedIndex));
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "CONTACT",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          style: theme.elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) =>
                  theme.brightness == Brightness.light
                      ? bgColorDarkTheme
                      : primaryColor,
            ),
            shadowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) =>
                  theme.brightness == Brightness.light
                      ? bgColorDarkTheme
                      : textColorDarkTheme,
            ),
          ),
        ),
      ],
    );
  }
}
