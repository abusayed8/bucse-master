import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractUsClass extends StatefulWidget {
  const ContractUsClass({Key? key}) : super(key: key);

  @override
  _ContractUsClassState createState() => _ContractUsClassState();
}

class _ContractUsClassState extends State<ContractUsClass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contract Us',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //outlineIconButton(context,Icons.add_to_home_screen,"Our Website",Colors.blue,launch("https://cse.bu.edu.bd/")),
                outlineButton('Our Website',Icons.add_to_home_screen,Colors.blue),
                SizedBox(
                  height: 10,
                ),
                outlineButton('Like Us On Facebook',Icons.facebook,Colors.amber),
                SizedBox(
                  height: 10,
                ),
                outlineButton('Phone',Icons.phone,Colors.green),
                SizedBox(
                  height: 10,
                ),
                outlineButton('Email',Icons.add_to_home_screen,Colors.pinkAccent),
                SizedBox(
                  height: 10,
                ),
                outlineButton('BU Map',Icons.map,Colors.deepPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget outlineButton(String btnText,IconData icon,Color color){
    return InkWell(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: color, width: 20.0,

          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: color,),
            Text(
              btnText,
              style: TextStyle(fontSize: 25,color: color),
            ),
          ],
        ),
    ),
          onTap: () async{
        if(btnText=='Our Website') {
          launch("https://cse.bu.edu.bd/");
        }
          else if (btnText=='Like Us On Facebook') {launch("https://www.facebook.com/bangladeshuni/");}
          else if(btnText=='Phone') {launch("tel://+8801755559301");}
          else if(btnText=='Email') {launch("mailto:cse@bu.edu.bd?subject=Hi&body=How are you%20plugin");}
          else{
        //double.parse(widget.latitude),double.parse(widget.longitude)
          double lat = 23.7614822;
          double long =90.3674428;
         String googleMapslocationUrl =
            "https://www.google.com/maps/search/?api=1&query=$lat,$long";

        final String encodedURl =
        Uri.encodeFull(googleMapslocationUrl);

        if (await canLaunch(encodedURl)) {
          await launch(encodedURl);
        } else {
          print('Could not launch $encodedURl');
          throw 'Could not launch $encodedURl';
        }
      };

    } ,

    );

  }
}
