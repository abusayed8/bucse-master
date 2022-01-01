import 'package:bucseproject/widgets/heading_decoraion.dart';
import 'package:flutter/material.dart';

class Campuses extends StatefulWidget {
  const Campuses({Key? key}) : super(key: key);

  @override
  _CampusesState createState() => _CampusesState();
}

class _CampusesState extends State<Campuses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Campuses'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Heading('First Campus',20.0,size.width,Colors.white,Colors.blueGrey),
            Image.asset(
              'images/campuses/1stcampus.jpg',
              height:size.height * .35 ,
              fit: BoxFit.fill,
            ),
            Text('15/1 Iqbal Road,Dhaka 1207',
              style: TextStyle(color: Colors.red,fontSize: 15),),
            Divider(),
            Heading('Second Campus',20.0,size.width,Colors.white,Colors.blueGrey),
            Image.asset(
              'images/campuses/2ndcampus.jpg',
              height:size.height * .35 ,
              fit: BoxFit.fill,
            ),
            Text('House-3/3,Asad Ave,Dhaka 1207',
              style: TextStyle(color: Colors.red,fontSize: 15),),
            Divider(),
            Heading('Third Campus',20.0,size.width,Colors.white,Colors.blueGrey),
            Image.asset(
              'images/campuses/3rdcampus.jpg',
              height:size.height * .35 ,
              fit: BoxFit.fill,
            ),
            Text('Masjid Market complex Road,Dhaka 1207',
              style: TextStyle(color: Colors.red,fontSize: 15),),
            Divider(),
            Heading('Fourth Campus',20.0,size.width,Colors.white,Colors.blueGrey),
            Image.asset(
              'images/campuses/4thcampus.jpg',
              height:size.height * .35 ,
              fit: BoxFit.fill,
            ),
            Text('14/A Iqbal Road,Dhaka 1207',
              style: TextStyle(color: Colors.red,fontSize: 15),),
            Divider(),
            Heading('Permanent Campus',20.0,size.width,Colors.white,Colors.blueGrey),
            Image.asset(
              'images/campuses/permanentcampus.jpg',
              height:size.height * .35 ,
              fit: BoxFit.fill,
            ),
            Text('Sodor Ghat,Gabtoli Road',
              style: TextStyle(color: Colors.red,fontSize: 15),),
            Divider(),

          ]
          ),
        ),
      ),
    );
  }
}
