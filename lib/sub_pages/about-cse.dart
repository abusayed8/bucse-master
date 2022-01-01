import 'package:bucseproject/widgets/heading_decoraion.dart';
import 'package:flutter/material.dart';
class AboutCse extends StatefulWidget {
  const AboutCse({Key? key}) : super(key: key);

  @override
  _AboutCseState createState() => _AboutCseState();
}

class _AboutCseState extends State<AboutCse> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('About CSE'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Heading('MESSAGE FROM ADVISOR',size.height*0.026,double.infinity,Colors.blueGrey,Colors.white),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.blue,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/faculty_members/kazi_jamilAzhar.png',height: 100,width: 100,fit: BoxFit.fill),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quazi Jamil Azher',
                        style: TextStyle(
                        fontSize: size.height*0.024,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                      Text('Advisor',
                        style: TextStyle(
                            fontSize: size.height*0.024,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                      Text('Department of CSE',
                        style: TextStyle(
                            fontSize: size.height*0.024,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                    ],
                  )

                ],
              ),
            ),
            Text('Welcome to the Computer Science and Engineering Department (CSE) at the '
                'Bangladesh University   As Advisor of CSE, I would like to share with you '
                'some highlights of our department – our world class faculty and research '
                'centers, flexible degree program options, successful alumni, and great job '
                'markets. CSE faculty perform world-class research in basic theory, software '
                'and hardware, and are recipients of numerous national and international awards.'
                ' The CSE department is deeply committed to providing the highest quality of '
                'undergraduate graduate education.  Many of our faculty have been recognized for'
                ' outstanding teaching by the university award for Teaching Excellence. The CSE '
                'department offers many opportunities to expand your intellectual horizons through '
                'out distinguished-lecture series, student clubs, and innovative projects in our '
                'advanced courses and at our research centers. I would like to make a special mention'
                ' of our unique software engineering and engineering design courses, where students '
                'develop software and hardware tools for building experimental devices that are used '
                'by disabled individuals and their caregivers.  The department is thus a leader in '
                'bringing socially relevant projects into the CSE curriculum.I hope you will enjoy our'
                ' website and welcome you to the Department of Computer Science and Engineering.',
              style: TextStyle(
                fontSize: size.height*0.02,
              ),
              textAlign: TextAlign.justify,

            ),
            Heading('MESSAGE FROM ADVISOR',size.height*0.026,double.infinity,Colors.blueGrey,Colors.white),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.blue,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/sadiqsir.jpg',height: 100,width: 100,fit: BoxFit.fill,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Md. Sadiq Iqbal',
                          style: TextStyle(
                              fontSize: size.height*0.024,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        Text('Assistant Professor & Head',
                          style: TextStyle(
                              fontSize: size.height*0.024,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        Text('Department of CSE',
                          style: TextStyle(
                              fontSize: size.height*0.024,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                      ],
                    ),
                  )

                ],
              ),
            ),
            Text('I would like to extend my warmest welcome to you as the Head to the Department'
                ' of Computer Science and Engineering at the Bangladesh University. Computing has'
                ' revolutionized our world as we know it in the past two decades and will continue '
                'to serve as the core of all technologies in the 21st century. To prepare the '
                'future leaders for these innovations, I am proud to be the Head of a department'
                ' which offers B.Sc. degree programs in Computer Science & Engineering.The Department'
                ' of Computer Science at Bangladesh University provides a comprehensive education '
                'that equips our graduates with the technical skills, expert knowledge and professional'
                ' ethics that are necessary to participate and play leadership roles in the digital '
                'revolution. The Department achieves this by recruiting and continuously developing high '
                'caliber teaching and research staff, stringently monitoring our teaching quality and '
                'academic programs, carrying out cutting edge research and building close collaboration'
                ' with local industries in strategic areas. We stress the importance of out of classroom '
                'experience by organizing study tours, arranging student exchange programs and supporting'
                ' our students when they take part in local and international IT contests and other '
                'extracurricular activities. The 3D Motion Capture Laboratory concentrates on research '
                'projects on image and motion processing technologies.There are so many ways you can be '
                'part of and achieve in the department: come visit us and find out what opportunities we '
                'can present you as a prospective student; look to us on how to provide student talent as'
                ' an employer; bring us the latest updates about what is happening with you as a graduate; '
                'explore with us on how we can facilitate collaborations either in research or education '
                'if you have any ideas of your own, etc. I am always ready to have an exchange on any of '
                'the issues related to the building of the department and will try to make these topics '
                'equally exciting to you. I hope to see you here.',
              style: TextStyle(
                fontSize: size.height*0.02,
              ),
              textAlign: TextAlign.justify,

            )
          ],
        ),
      ),
    );
  }
}
