import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InvoiceForm extends StatefulWidget {
  @override
  _InvoiceFormState createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  List<Map<String, String>> _items = [];
  Map<String, dynamic> _data = {};
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Email field
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32, right: 32),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                return null;
              },
            ),
          ),

          // Item rows
          ..._items.map((item) => _buildItemRow(item)),
          SizedBox(height: 16),
          // Add item button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _items
                    .add({'quantity': '', 'description': '', 'unit_cost': ''});
              });
            },
            child: Text('Add Item'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(42.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  _data.addAll({'email': _emailController.text});
                  _data.addAll({'items': []});

                  for (int i = 0; i < _items.length; i++) {
                    _data["items"].add(
                      {
                        'amount': (double.parse(_items[i]["unit_cost"]!) * 100),
                        'currency': "usd",
                        'quantity': double.parse(_items[i]["quantity"]!),
                        'description': _items[i]["description"],
                      },
                    );
                    total += (double.parse(_items[i]["unit_cost"]!) *
                        int.parse(_items[i]["quantity"]!));
                  }
                  _data.addAll({"total": total});

                  FirebaseFirestore.instance.collection("invoices").add(_data);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Successfully Uploaded Invoice")));
                },
                label: Padding(
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Submit"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemRow(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          // Quantity field
          Expanded(
            child: TextFormField(
              initialValue: item['quantity'],
              decoration: InputDecoration(labelText: 'Quantity'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a quantity';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  item['quantity'] = value;
                });
              },
            ),
          ),

          SizedBox(width: 30),

          // Description field
          Expanded(
            child: TextFormField(
              initialValue: item['description'],
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  item['description'] = value;
                });
              },
            ),
          ),

          SizedBox(width: 30),

          // Unit cost field
          Expanded(
            child: TextFormField(
              initialValue: item['unit_cost'],
              decoration: InputDecoration(labelText: 'Unit Cost'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a unit cost';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  item['unit_cost'] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
