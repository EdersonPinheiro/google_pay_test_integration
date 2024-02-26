import 'package:flutter/material.dart';
import 'package:gpaymentapp/payment_config.dart';
import 'package:pay/pay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
          label: 'Total', amount: '0.01', status: PaymentItemStatus.final_price)
    ],
    width: double.infinity,
    type: GooglePayButtonType.pay,
    margin: EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: googlePayButton,
        ),
      ),
    );
  }
}
