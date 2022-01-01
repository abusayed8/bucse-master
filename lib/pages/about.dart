import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bangladesh University',style: TextStyle(color: Colors.red),),centerTitle: true,backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text('About',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 100,
                ),
                Image.asset("images/cse.png"),
                SizedBox(
                  height: 30,
                ),
                Text('Designed and Developing By',style: TextStyle(fontSize: 15,color: Colors.black),),
                SizedBox(
                  height: 15,
                ),
                Text('Directorate of CSE Family',style: TextStyle(fontSize: 25),),
                SizedBox(
                  height: 10,
                ),
                Text('Bangladesh University',style: TextStyle(fontSize: 20,color: Colors.black)),

              ],
            ),

          ),

        ),
      ),
    );
  }
}
