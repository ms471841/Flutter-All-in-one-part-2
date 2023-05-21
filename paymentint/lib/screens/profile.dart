import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Ink(
                  height: 250,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 6),
                            ),
                            child: Hero(
                              tag: 'image',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.network(
                                  authData.user!.photoUrl!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        authData.user!.name!,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            "E-Mail",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                          subtitle: Text(authData.user!.email!),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                        ListTile(
                          title: Text(
                            "Phone Number",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.phone_android,
                            color: Colors.cyan,
                          ),
                          subtitle: Text("Number not found"),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                        ListTile(
                          title: Text(
                            "About",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.people,
                            color: Colors.cyan,
                          ),
                          subtitle: Text("You are "),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
