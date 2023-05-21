// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Razorpay Demo',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Razorpay _razorpay;

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print("Payment success");
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print("Payment error: ${response.message}");
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print("External wallet selected: ${response.walletName}");
//   }

//   void _openCheckout() {
//     var options = {
//       'key': 'rzp_test_CVIB2W4XEdwPyx',
//       'amount': 100,
//       'name': 'Sample Payment',
//       'description': 'This is the sample payment',
//       'prefill': {'contact': '', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm', 'phonepay']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _openCheckout,
//           child: Text('Pay'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   late Razorpay _razorpay;
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   void _openCheckout(int amount) async {
//     var options = {
//       'key': 'rzp_test_CVIB2W4XEdwPyx',
//       'amount': amount * 100,
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: ${e.toString()}');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     debugPrint(
//         'Payment success: Order Id: ${response.orderId}, Payment Id: ${response.paymentId}, Signature: ${response.signature}');
//     // Update server with payment success details
//     _updatePaymentStatus(response.orderId, response.paymentId, 'success');
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     debugPrint(
//         'Payment error: Code: ${response.code}, Message: ${response.message}');
//     // Update server with payment failure details
//     _updatePaymentStatus('', '', 'failure');
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     debugPrint('External Wallet: ${response.walletName}');
//   }

//   void _updatePaymentStatus(
//       String? orderId, String? paymentId, String status) async {
//     // Make an API call to your server to update the payment status
//     // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
//     var url = Uri.parse('YOUR_API_ENDPOINT');
//     var response = await http.post(
//       url,
//       body: {
//         'orderId': orderId,
//         'paymentId': paymentId,
//         'status': status,
//       },
//     );

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       // Handle the response from your server
//       // Example: display a success message or perform additional actions
//       debugPrint('Payment status updated: ${responseData['message']}');
//     } else {
//       // Handle the error case
//       debugPrint('Failed to update payment status: ${response.statusCode}');
//     }
//   }

//   void _initiateRefund(String paymentId, double amount) async {
//     // Make an API call to initiate a refund
//     // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
//     var url = Uri.parse('YOUR_API_ENDPOINT');
//     var response = await http.post(
//       url,
//       body: {
//         'paymentId': paymentId,
//         'amount': amount.toString(),
//       },
//     );

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
// // Handle the response from your server
// // Example: display a success message or perform additional actions
//       debugPrint('Refund initiated: ${responseData['message']}');
//     } else {
// // Handle the error case
//       debugPrint('Failed to initiate refund: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _textEditingController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter amount',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 int? amount = int.tryParse(_textEditingController.text);
//                 if (amount != null && amount > 0) {
//                   _openCheckout(amount);
//                 } else {
//                   debugPrint('Invalid amount');
//                 }
//               },
//               child: Text('Make Payment'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
// // Example: Initiate a refund for a payment
//                 String paymentId = 'YOUR_PAYMENT_ID';
//                 double refundAmount = 10.0;
//                 _initiateRefund(paymentId, refundAmount);
//               },
//               child: Text('Initiate Refund'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
