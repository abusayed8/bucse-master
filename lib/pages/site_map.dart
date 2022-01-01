import 'package:flutter/material.dart';
class SiteMap extends StatefulWidget {
  const SiteMap({Key? key}) : super(key: key);

  @override
  _SiteMapState createState() => _SiteMapState();
}

class _SiteMapState extends State<SiteMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Site Map'),centerTitle: true,),
      body: Center(
        child: Text('Site Map'),
      ),
    );
  }
}
