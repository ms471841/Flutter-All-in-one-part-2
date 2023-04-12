import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External wallet selected: ${response.walletName}");
  }

  void _openCheckout() {
    var options = {
      key: '2hy4WDtgJ37yR3AWSkwDmiYq',
      amount: 2000,
      name: 'Tiger King',
      description: 'Play Game',
      prefill: {contact: '8888888888', email: 'test@razorpay.com'},
      external: {
        wallets: ['paytm', 'phonepay']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openCheckout,
          child: Text('Pay with Razorpay'),
        ),
      ),
    );
  }
}
