import 'package:bucseproject/widgets/heading_decoraion.dart';
import 'package:flutter/material.dart';
class SylabusClass extends StatefulWidget {
  const SylabusClass({Key? key}) : super(key: key);

  @override
  _SylabusClassState createState() => _SylabusClassState();
}

class _SylabusClassState extends State<SylabusClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Syllabus'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Heading('DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING',17.0,size.width,Colors.blueGrey,Colors.white),
              Image.asset(
                'images/syllabus/s.title.png',
                height: MediaQuery.of(context).size.height * .25 ,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('First Year 1st Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Container(
                child: Image.asset(
                  'images/syllabus/1st.png',
                  height: MediaQuery.of(context).size.height * .4,
                  fit: BoxFit.fill,
                ),
              ),

              Divider(),
              Heading('First Year 2nd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/2nd.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('First Year 3rd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/3rd.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Second Year 1st Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/4th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Second Year 2nd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/5th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Second Year 3rd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/6th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Third Year 1st Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/7th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Third Year 2nd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/8th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Third Year 3rd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/9th.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Fourth Year 1st Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/10.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Fourth Year 2nd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/11.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
              Divider(),
              Heading('Fourth Year 3rd Semester',17.0,size.width,Colors.white,Colors.blueGrey),
              Image.asset(
                'images/syllabus/12.png',
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
