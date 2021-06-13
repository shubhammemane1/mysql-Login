import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => Navigator.of(context).popAndPushNamed('/home'),
        ),
      ),
    );
  }
}
