import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:invoiceninja/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

class StorefrontView extends StatefulWidget {
  const StorefrontView({Key? key}) : super(key: key);

  @override
  State<StorefrontView> createState() => _StorefrontViewState();
}

class _StorefrontViewState extends State<StorefrontView> with WidgetsBindingObserver {
  List<Product> _products = [];

  String _email = '';
  Product? _product;
  Invoice? _invoice;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    InvoiceNinja.configure(
      'arbiterPM', // Set your company key or use 'KEY' to test
      //url: 'https://arbiterpm.invoiceninja.com', // Set your selfhost app URL
      debugEnabled: true,
    );

    InvoiceNinja.products.load().then((value) {
      setState(
        () {
          _products = value;
        },
      );
    });
  }

  void _createInvoice() async {
    var client = Client.forContact(email: _email);
    client = await InvoiceNinja.clients.save(client);
    var invoice = Invoice.forClient(client, products: [_product!]);
    invoice = await InvoiceNinja.invoices.save(invoice);

    setState(() {
      _invoice = invoice;
    });
  }

  void _viewPdf() {
    launchUrl(Uri.parse(
      'https://docs.google.com/gview?embedded=true&url=${_invoice!.pdfUrl}',
    ));
  }

  void _viewPortal() {
    final invitation = _invoice!.invitations.first;
    launchUrl(Uri.parse(invitation.url));
  }

  void showSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$text'),
    ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }

    final invoice = await InvoiceNinja.invoices.findByKey(_invoice!.key);

    if (invoice.isPaid) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Thank you, your payment was sent'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Arbiter Project Management - Store Front")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) => setState(
                      () => _email = value,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<Product>(
                    decoration: InputDecoration(
                      labelText: 'Product',
                    ),
                    onChanged: (value) => setState(() => _product = value),
                    items: _products
                        .map((product) => DropdownMenuItem(
                              child: Text(product.productKey),
                              value: product,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade900),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade400),
                    ),
                    child: Text('Create Invoice'),
                    onPressed: (_email.isNotEmpty && _product != null)
                        ? () => _createInvoice()
                        : null,
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade900),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade400),
                    ),
                    child: Text('View PDF'),
                    onPressed: (_invoice != null) ? () => _viewPdf() : null,
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade900),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade400),
                    ),
                    child: Text('View Portal'),
                    onPressed: (_invoice != null) ? () => _viewPortal() : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
