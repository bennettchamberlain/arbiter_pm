import 'package:arbiter_pm/widgets/invoice_form.dart';
import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [SizedBox(height: 32), Text("New Invoice"), InvoiceForm()],
      ),
    ));
  }
}
