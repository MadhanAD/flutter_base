import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({this.title = ""});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CardFieldInputDetails? _card;
  String _email = '';
  bool? _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: CardField(
              onCardChanged: (card) {
                setState(() {
                  _card = card;
                });
              },
            ),
          ),
          CheckboxListTile(
            value: _saveCard,
            onChanged: (value) {
              setState(() {
                _saveCard = value;
              });
            },
            title: Text('Save card during payment'),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _handlePayPress,
              child: Text("Pay Now"),
            ),
          ),
          if (_card != null)
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(_card!.toJson().toString())),
        ],
      ),
    );
  }

  Future<void> _handlePayPress() async {
    if (_card == null) {
      return;
    }

    // 1. fetch Intent Client Secret from backend
    final clientSecret = await fetchPaymentClientSecret();
    // 2. Gather customer billing information (ex. email)
    final billingDetails = BillingDetails(
      email: 'email@stripe.com',
      phone: '+48888000888',
      address: Address(
        city: 'Houston',
        country: 'US',
        line1: '1459  Circle Drive',
        line2: '',
        state: 'Texas',
        postalCode: '77063',
      ),
    ); // mo mocked data for tests

    final paymentIntent = await Stripe.instance.confirmPaymentMethod(
      clientSecret,
      PaymentMethodParams.card(billingDetails: billingDetails),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Success!: The payment was confirmed successfully!')));
  }

  Future<String> fetchPaymentClientSecret() async {
    var response = await http.get(Uri.parse("http://localhost:3000"));
    var jsonData = jsonDecode(response.body);
    var clientSecret = jsonData["paymentIntent"]["client_secret"];
    debugPrint("response ${clientSecret}");
    return clientSecret;
  }
}
