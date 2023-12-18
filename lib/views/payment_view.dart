import 'package:arbiter_pm/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import '../models/invoice_model.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String _email = '';
  bool invoice = false;
  List<Map<String, dynamic>> invoices = [];

  void _findClient() async {
    try {
      final db = FirebaseFirestore.instance.collection('invoices');
      final invoiceRef = db.where("email", isEqualTo: _email);

      // .withConverter(
      //       fromFirestore: Invoice.fromFirestore,
      //       toFirestore: (Invoice invoice, _) => invoice.toFirestore(),
      //     );

      invoiceRef.get().then((query) {
        final invoiceList = query.docs;

        if (invoiceList.length == 0) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Client Not Found")));
        } else {
          print(query.docs[0]);
          query.docs.forEach(
            (element) {
              invoices.add(element.data());
            },
          );
          setState(() {
            invoices = invoices;
            invoice = true;
          });
        }
      }, onError: (e) {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pay an Invoice")),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email),
                            ),
                            onChanged: (value) =>
                                setState(() => _email = value),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton(
                            onPressed: (_email.isNotEmpty)
                                ? () => _findClient()
                                : null,
                            child: const Text('Find Client'),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              (invoice != true)
                  ? SizedBox()
                  : Column(children: showStripeInvoices())
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> showStripeInvoices() {
    return List.generate(invoices.length, (index) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 200,
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Invoice number: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800)),
                        Text("000${index + 1}", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Items: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Quantity"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Description    "),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Amount"),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            invoices[index]["items"].length,
                            (index2) {
                              return Card.outlined(
                                color: kPitchDark,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // (invoices[index]['items'][index2]
                                    //             ["quantity"] ==
                                    //         null)
                                    //     ?
                                    itemsNumber(
                                        "${invoices[index]['items']?[index2]['quantity']}"),

                                    // : const Padding(
                                    //     padding: EdgeInsets.all(16),
                                    //     child: Text(""),
                                    //   ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                          "${invoices[index]['items'][index2]["description"]}"),
                                    ),
                                    moveDecimalAmount(
                                        "${invoices[index]['items'][index2]["amount"]}"),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text("Total:"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Text(
                            "\$${(invoices[index]['total']).toStringAsFixed(2)}"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlinedButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse(
                              invoices[index]["stripeInvoiceUrl"],
                            ),
                          );
                        },
                        child: const Text("Pay your invoice")),
                  )
                ],
              ),
            )),
      );
    });
  }

  Widget moveDecimalAmount(String amount) {
    double newamount = int.parse(amount) / 100;
    setState(() {
      total += newamount;
    });
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("\$${newamount.toStringAsFixed(2)}"),
    );
  }

  Widget itemsNumber(String amount) {
    if (amount == "null") {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text("1"),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text("$amount"),
      );
    }
  }
}
