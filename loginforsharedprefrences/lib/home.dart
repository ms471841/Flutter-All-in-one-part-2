import 'package:flutter/material.dart';
import 'package:loginforsharedprefrences/share.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Helper.saveUserLoggedInSharedPreference(false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signin(),
                  ),
                );
              },
              child: Text('Sign out'))),
    );
  }
}

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log In Screen'),),
      body: Center(
        child: ElevatedButton(
          child: Text("Log In"),
          onPressed: () {
            Helper.saveUserLoggedInSharedPreference(true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
      ),
    );
  }
}
