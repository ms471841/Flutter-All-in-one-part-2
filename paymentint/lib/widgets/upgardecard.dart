import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:paymentint/utiles/formateDateAndTime.dart';
import 'package:provider/provider.dart';

class UpgradeCard extends StatelessWidget {
  const UpgradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rs ${value.user!.subscriptionAmount.toString()}/Year'),
                Text(
                    'End Date : ${formatDate(value.user!.subscriptionEndDate!)}')
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                  child: const Text("Upgrade"),
                ),
                const Text(
                  'Upgrade for more benifits',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
