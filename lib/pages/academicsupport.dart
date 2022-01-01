import 'package:flutter/material.dart';

class AcademicSupport extends StatefulWidget {
  const AcademicSupport({Key? key}) : super(key: key);

  @override
  _AcademicSupportState createState() => _AcademicSupportState();
}

class _AcademicSupportState extends State<AcademicSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACADEMIC SUPPORT',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height * .99,
            width: MediaQuery.of(context).size.width * .90,
            //alignment: Alignment.center,

            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ACADEMIC SUPPORT",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * .08,
                    //width: MediaQuery.of(context).size.width * .90,
                    color: Colors.red,
                    child: Text('ACADEMIC SUPPORT',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                   // height: MediaQuery.of(context).size.height * .08,
                    //width: MediaQuery.of(context).size.width * .90,
                    child: Image.asset(
                      'images/1-Academic_Support.jpg',
                      height: MediaQuery.of(context).size.height * .4 ,
                      //width: MediaQuery.of(context).size.width * .90,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text("BANGLADESH UNIVERSITY encourages students to come in close contact with the teachers. For promotion of a high level of teacher-student interaction, each student is assigned to an Adviser and the student is free to discuss with his adviser all academic matters. Students are also encouraged to meet with other teachers any time for help and guidance in academic matters",style: TextStyle(color: Colors.black),),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  Container(
                    child: Image.asset(
                      'images/2-Academic_Support.jpg',
                      height: MediaQuery.of(context).size.height * .4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  Text("One adviser is normally appointed for a group of students by the Board of Undergraduate Studies of the concerned department. The adviser advises each student about the courses to be taken in each term by discussing the academic program of that particular term with the student. An adviser will review and eventually approve the student’s specific plan of study and monitor subsequent progress of the student. The adviser is usually in the rank of an Assistant Professor or above of the concerned department."

                   ' The adviser may permit the students to drop one or more courses based on previous performances.',style: TextStyle(color: Colors.black),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
