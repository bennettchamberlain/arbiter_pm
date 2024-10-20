import 'package:arbiter_pm/widgets/contact_form.dart';
import 'package:arbiter_pm/widgets/responsive_widget.dart';
import 'package:arbiter_pm/widgets/social_card.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../constants/image_paths.dart';
import '../constants/text_logs.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: 900,
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1000),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 50,
            color: theme.brightness == Brightness.light
                ? kPitchDark.withOpacity(.1)
                : whitebackgroundColor.withOpacity(.05),
          ),
        ],
      ),
      child: Column(
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? const SizedBox()
              : const SizedBox(height: kDefaultPadding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialCard(
                iconSrc: iconPicWhatsApp,
                name: 'WhatsApp',
                color: const Color(0xFFD9FFFC),
                press: () => launchURLs(whatsAppLink),
              ),
              SocialCard(
                iconSrc: emailIcon,
                name: 'Email',
                color: const Color(0xFFE4FFC7),
                press: () => launchEmailUrl(),
              ),
              SocialCard(
                iconSrc: iconPicGithub,
                name: 'Github',
                color: const Color(0xFFE8F0F9),
                press: () => launchURLs(githubLink),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}
