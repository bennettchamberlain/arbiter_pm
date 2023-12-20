import 'package:arbiter_pm/constants/colors.dart';
import 'package:arbiter_pm/constants/constants.dart';
import 'package:arbiter_pm/constants/text_styles.dart';
import 'package:arbiter_pm/models/recentwork_model.dart';
import 'package:flutter/material.dart';

class RecentWorkDialog extends StatefulWidget {
  int index;
  RecentWorkDialog({required this.index, Key? key}) : super(key: key);

  @override
  State<RecentWorkDialog> createState() => _RecentWorkDialogState();
}

class _RecentWorkDialogState extends State<RecentWorkDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: platinum,
      body: SingleChildScrollView(
        child: Container(
          color: platinum,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.keyboard_backspace, color: davyGrey),
                  ),
                ],
              ),
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(children: [
                    (recentWorksDetails[widget.index].platform != null)
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              recentWorksDetails[widget.index].platform!,
                              style: recentworkcardText2TextStyle,
                            ),
                          )
                        : const Text(""),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recentWorksDetails[widget.index].title,
                        style: recentworkcardText4TextStyle,
                      ),
                    ),
                    const SizedBox(height: 10),
                    (recentWorksDetails[widget.index].image != null)
                        ? Image.asset(recentWorksDetails[widget.index].image!)
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: recentWorksDetails[widget.index].description),
                    const SizedBox(height: kDefaultPadding * 3),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
