import 'package:bucseproject/widgets/heading_decoraion.dart';
import 'package:flutter/material.dart';

class HistoryClass extends StatefulWidget {
  const HistoryClass({Key? key}) : super(key: key);

  @override
  _HistoryClassState createState() => _HistoryClassState();
}

class _HistoryClassState extends State<HistoryClass> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(  
          'History',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Heading('HISTORY OF CSE DEPARTMENT',size.height*0.026,double.infinity,Colors.red,Colors.white),
              Text(
                'In the month of October 2001 Bangladesh University opened its doors'
                ' to students with Late Quazi Azher Ali as the first Vice-Chancellor of'
                ' the University with only one department Computer Science & Engineering.'
                ' The total students of the 1st Batch are 17.The University started its '
                'activities with 3 Faculties,1 Departments, 17 students and 1 academic'
                ' cum administrative building. At present the University consists of 3 '
                'Faculties, 10 Departments, 3 academic buildings, 2 hostels and more than '
                '5000 student in BU of which total current CSE students are 1400.The main'
                ' purpose of the University was to create new areas of knowledge and disseminate'
                ' this knowledge to the society through its students. Since its inception the '
                'University has a distinct character of having distinguished scholars as faculties'
                ' who have enriched the global pool of knowledge by making notable contributions '
                'in the fields of teaching and research.The high standard of education and research '
                'for the University was set by its first Late Quazi Azher Ali when in the 1st '
                'Convocation address he said, “A man may be an excellent teacher of elementary '
                'subjects without the power to add to knowledge. But in advanced work I maintain'
                ' that no one can really teach well unless he has the combination of imagination '
                'with critical power which leads to the original production (of knowledge), and for'
                ' that if for no other reason, a university to be a true university must see that its'
                ' teachers are men who are also capable of advancing knowledge.While serving as the '
                'highest echelon of academic excellence, the University also functions as a central '
                'premise for free thought and democratic practices that would lead the nation to its '
                'march towards progress. Bangladesh University is increasingly striving to combine the'
                ' pursuit of knowledge and truth with the values and needs of an evolving society.Presently'
                ' the University enrolls more than 1000 students per semester of which about 150 students'
                ' are enrolling in this department. Actually the student admission rate increases when our'
                ' present head of the department took the charge of this department in 2007. After that he '
                'took initiatives for the admission of students and his mission is now successful. At present'
                ' CSE is the 2nd highest number of students in BU.The CSE Department is dedicated to the '
                'advancement of learning, and is committed to promoting research in all fields of knowledge.'
                'As there are plans for further expansion of facilities, plans for new avenues and '
                'opportunities, the course curricula are updated and new research projects are undertaken '
                'every year. As the pioneer, the University has taken the task to foster the transformation '
                'processes of the individual students and the country as a whole through its educational and'
                ' research facilities keeping up with demands of the day.',
                style: TextStyle(
                  fontSize: size.height*0.02,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("images/history2.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "INTERNATIONAL PROGRAMING CONTEST 2014",
                style: TextStyle(
                  fontSize: size.height*0.02,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "November 02, 2014",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text(
                "The 4th Quazi Azher Ali International Programming Contest 2014 "
                "Organized by Department of Computer Science & engineering (CSE) "
                "of Bangladesh University was held on the campus on Saturday, 27th December",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),

              ///
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "images/history1.jpg",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "FIRST 3D PRINTER IN BANGLADESH",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Text(
                "November 02, 2014",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text(
                "Bangladesh University thinks the access of modern technology should"
                " available to the future engineer which will help them to build "
                "their luminous career. By providing 3D printer in the classroom Bangladesh"
                " University want to ensure that the students graduated from here will be",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
