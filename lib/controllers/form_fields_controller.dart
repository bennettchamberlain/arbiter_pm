import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arbiter_pm/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFieldsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController projectTypeController = TextEditingController();
  final TextEditingController projectBudgetController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  submitFormValues() {
    bool passedValidation = formKey.currentState!.validate();

    if (passedValidation) {
      formKey.currentState!.save();
      Get.snackbar(
        'Submitted',
        'Thanks for reaching out, we will get back to you within 24 hours.',
        maxWidth: 450,
        duration: snackbarDuration,
        margin: const EdgeInsets.only(top: kDefaultPadding),
      );
    } else {
      Get.snackbar(
        'Oops',
        'Check your inputs and try again',
        maxWidth: 450,
        duration: snackbarDuration,
        margin: const EdgeInsets.only(top: kDefaultPadding),
      );
    }
  }

  uploadDatatoFirestore(String name, String email, String projectType,
          String projectBudget, String message) =>
      fireStore.collection('contactForm').add({
        'name': name,
        'email': email,
        'projectType': projectType,
        'projectBudget': projectBudget,
        'message': message
      });
}
