import 'package:cloud_firestore/cloud_firestore.dart';

class Invoice {
  final String? email;
  final List<Map>? items;
  final String? stripeInvoiceId;
  final String? stripeInvoiceRecord;
  final String? stripeInvoiceUrl;

  Invoice({
    this.email,
    this.items,
    this.stripeInvoiceId,
    this.stripeInvoiceRecord,
    this.stripeInvoiceUrl,
  });

  factory Invoice.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Invoice(
      email: data?['name'],
      items: data?['state'],
      stripeInvoiceId: data?['country'],
      stripeInvoiceRecord: data?['capital'],
      stripeInvoiceUrl: data?['population'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) "email": email,
      if (items != null) "items": items,
      if (stripeInvoiceId != null) "stripeInvoiceId": stripeInvoiceId,
      if (stripeInvoiceRecord != null)
        "stripeInvoiceRecord": stripeInvoiceRecord,
      if (stripeInvoiceUrl != null) "stripeInvoiceUrl": stripeInvoiceUrl,
    };
  }
}
