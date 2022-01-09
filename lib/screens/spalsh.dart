import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'login_page.dart';

class SpalshScreen extends StatefulWidget {
  final plugin = FacebookLogin(debug: true);
  SpalshScreen({Key? key, plugin}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  final plugin = FacebookLogin(debug: true);
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(plugin: plugin),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: new Image.asset(
                  'assets/images/image.gif',
                  height: 150,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Dog Path',
                    style: TextStyle(fontSize: 34),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    'by',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Center(
                  child: Text(
                    'VirtousStack Software Pvt . Ltd.',
                    style: TextStyle(fontSize: 18, letterSpacing: 0.2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
