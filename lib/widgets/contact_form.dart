import 'package:arbiter_pm/widgets/a_text_button.dart';
import 'package:arbiter_pm/widgets/portfolio_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../constants/image_paths.dart';
import '../controllers/form_fields_controller.dart';

class ContactForm extends GetView<FormFieldsController> {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          PortfolioTextFormField(
            controller: controller.nameController,
            labelText: 'Your Name',
            hintText: 'Enter your name',
            validator: (v) {
              if (v == '') {
                return 'Please enter your name';
              }
            },
          ),
          PortfolioTextFormField(
            controller: controller.emailController,
            labelText: 'Email Address',
            hintText: 'Enter your email address',
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Please enter some text';
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(v)) {
                return 'Please enter a valid email';
              }
              sendEmail(v, "Thank you contacting Arbiter PM",
                  "<h2>Hi ${controller.nameController.text},</h2><h3> Our team will respond to this email within 24 hours.</h3></br></br><p>Type of Project: ${controller.projectTypeController.text}</p></br><p>Project Budget: ${controller.projectBudgetController.text}</p></br><p>Description: ${controller.messageController.text}</p></br><h5>If you would like to include further comments or files, just reply to this email</h5>");
              sendEmail('bennett@arbiterpm.com', "New Lead",
                  "<h4>Name: ${controller.nameController.text}</h4></br><h4>Email: ${controller.emailController.text}</h4></br><h4>Type of Project: ${controller.projectTypeController.text}</h4></br><h4>Project Budget: ${controller.projectBudgetController.text}</h4></br><h4>Description: ${controller.messageController.text}</h4><h5>");
              return null;
            },
          ),
          PortfolioTextFormField(
            controller: controller.projectTypeController,
            labelText: 'Project Type',
            hintText: 'Type of Project',
            validator: (v) {
              if (v!.isEmpty) {
                return 'Please enter the nature of your project';
              }
              return null;
            },
          ),
          PortfolioTextFormField(
            controller: controller.projectBudgetController,
            labelText: 'Project Budget',
            hintText: 'Select project budget',
            validator: (v) {
              if (v!.isEmpty) {
                return 'Please enter a budget, a range is fine.';
              }
              return null;
            },
          ),
          SizedBox(
            child: TextFormField(
              controller: controller.messageController,
              maxLines: 7,
              minLines: 5,
              validator: (v) {
                if (v!.isEmpty) {
                  return ' ';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Write us a message',
              ),
            ),
          ),
          Center(
            child: FittedBox(
              child: ATextButton(
                width: 225,
                imageSrc: iconContactPic,
                text: 'Get In Touch',
                press: () {
                  FocusScope.of(context).unfocus();
                  controller.submitFormValues();
                  controller.uploadDatatoFirestore(
                    controller.nameController.text,
                    controller.emailController.text,
                    controller.projectTypeController.text,
                    controller.projectBudgetController.text,
                    controller.messageController.text,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
