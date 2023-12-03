import 'package:arbiter_pm/constants/colors.dart';
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.keyboard_backspace, color: davyGrey),
                  ),
                ],
              ),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(children: [
                    Text(recentWorksDetails[widget.index].platform),
                    SizedBox(height: 10),
                    Text(
                      recentWorksDetails[widget.index].title,
                      style: recentworkcardText1TextStyle,
                    ),
                    SizedBox(height: 10),
                    Image.asset(recentWorksDetails[widget.index].image),
                    SizedBox(height: 10),
                    recentWorksDetails[widget.index].description,
                    SizedBox(height: 20),
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
