import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:paymentint/utiles/formateDateAndTime.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (_, value, child) {
      return ListView.builder(
        itemCount: value.user!.subscriptionHistory!.length,
        itemBuilder: (context, index) {
          final subscription = value.user!.subscriptionHistory![index];
          return Card(
            color: Color.fromARGB(255, 218, 226, 233),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Amount: ${subscription.amount}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Date: ${formatDate(subscription.startDate)}'),
                    Text('End Date: ${formatDate(subscription.endDate)}'),
                  ],
                ),
                trailing: Icon(Icons.play_arrow),
              ),
            ),
          );
        },
      );
    });
  }
}
