import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  final int amount;
  final String url;

  PaymentService({this.amount = 10, this.url = ''});

  static init() {
    Stripe.publishableKey =
        'pk_live_51HRzgDHJwKTrrXWmGQy4Klr0Be9osKkewt1IYFzNB28odhCCAF5VUEdPpYehdzVUQMtyJcsMVtgzHgraimNdPs3h00kpix7ZGe';
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print('the amount to be charged is $amount');

    //PaymentMethod paymentMethod = await Stripe.buildWebCard
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {}
}
