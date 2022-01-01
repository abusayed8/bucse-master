import 'package:flutter/material.dart';
class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Account'),centerTitle: true,),
      body: Center(
        child: Text('My Account'),
      ),
    );
  }
}
