// import 'package:flutter/material.dart';
// import 'package:invoiceninja/invoiceninja.dart';
// import 'package:invoiceninja/models/invoice.dart';

// class InvoiceView extends StatefulWidget {
//   const InvoiceView({Key? key}) : super(key: key);

//   @override
//   State<InvoiceView> createState() => _InvoiceViewState();
// }

// class _InvoiceViewState extends State<InvoiceView> with WidgetsBindingObserver {
//   String _email = '';
//   Invoice? _invoice;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     InvoiceNinjaAdmin.configure(
//       'TOKEN',
//       //url: 'https://arbiterPM.invoiceninja.com/client/login', // Set your selfhost app URL
//       debugEnabled: true,
//     );
//   }

//   void _findClient() async {
//     try {
//       final client = await InvoiceNinjaAdmin.clients.findByEmail(_email);
//       print(client!.name);
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Client Not Found")));

//       print(e);
//     }
//   }

//   void _loadInvoices() async {
//     try {
//       final invoices = await InvoiceNinjaAdmin.invoices.load();
//       print(invoices);
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Invoice Not Found")));
//       print(e);
//     }
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (_invoice == null || state != AppLifecycleState.resumed) {
//       return;
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Pay an Invoice")),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       floatingLabelStyle: TextStyle(color: Colors.white),
//                       labelStyle: TextStyle(color: Colors.white),
//                       labelText: 'Email',
//                       suffixIcon: Icon(Icons.email),
//                     ),
//                     onChanged: (value) => setState(() => _email = value),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 16),
//                   OutlinedButton(
//                     onPressed: (_email.isNotEmpty != null)
//                         ? () => _findClient()
//                         : null,
//                     child: const Text('Find Client'),
//                   ),
//                   const SizedBox(height: 16),
//                   OutlinedButton(
//                     child: Text('Load all Invoices'),
//                     onPressed: () => _loadInvoices(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
