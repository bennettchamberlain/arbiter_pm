import 'package:flutter/material.dart';
import '../constants/image_paths.dart';

class LoGo extends StatelessWidget {
  const LoGo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pngArbiterLogo,
      scale: 12,
    );
    //return SvgPicture.asset(svgArbiterLogo, semanticsLabel: 'Arbiter Logo');
  }
}
