import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(authData.user!.name!),
            accountEmail: Text(authData.user!.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(authData.user!.photoUrl!),
            ),
          ),
          // Add more widgets here if needed

          DrawerItem(),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key});
  final items = [
    {'title': 'My Account', 'icon': Icons.wallet_outlined, 'route': '/profile'},
    // {'title': 'Sign out', 'icon': Icons.logout, 'route': '/signup'}
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ListTile(
          leading: Icon(item['icon'] as IconData?),
          title: Text(item['title'] as String),
          onTap: () async {
            // Handle item tap here
            //  await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, item['route'] as String);
          },
        );
      },
    );
  }
}
