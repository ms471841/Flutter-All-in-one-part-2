import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:paymentint/widgets/drawer.dart';
import 'package:paymentint/widgets/upgardecard.dart';
import 'package:paymentint/widgets/userhistory.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  Future<void> _getUserData() async {
    _isLoading = true;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getUserData();
    _isLoading = false;
  }

  Future<void> _signout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Navigator.pushNamed(context, '/signup'));
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, child) {
      return Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(onPressed: _signout, icon: Icon(Icons.logout_rounded))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AuthProvider>(
              builder: (context, value, child) {
                return _isLoading || value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Current Plan',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          UpgradeCard(),
                          Text(
                            "History",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: History()),
                        ],
                      );
              },
            ),
          ));
    });
  }
}
