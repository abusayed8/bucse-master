import 'package:bucseproject/widgets/heading_decoraion.dart';
import 'package:flutter/material.dart';
class FacultyMemberDetails extends StatefulWidget {
  String? id;
  String? fid;
  String? fpassword;
  String? fphone;
  String? departmentname;
  String? fimage;
  String? fmembername;
  String? fmemberemail;
  String? fdesignation;
  String? facademicqualification;
  String? fteachingarea;
  String? fresearch;
  String? fjournalpublication;
  String? submitdate;
  String? timestamp;

  FacultyMemberDetails(
      {
        this.id,
        this.fid,
        this.fpassword,
        this.fphone,
        this.departmentname,
        this.fimage,
        this.fmembername,
        this.fmemberemail,
        this.fdesignation,
        this.facademicqualification,
        this.fteachingarea,
        this.fresearch,
        this.fjournalpublication,
      });

  @override
  _FacultyMemberDetailsState createState() => _FacultyMemberDetailsState();
}

class _FacultyMemberDetailsState extends State<FacultyMemberDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Faculty Member Details'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: widget.fimage!=null ?Image.network(
                '${widget.fimage}',
                width: size.width,
                height: size.height * 0.3,
                fit: BoxFit.fill,
              ):Image.asset('images/user.png',width: size.width ,
                height: size.height * 0.3,
                fit: BoxFit.fill,),
              ),
              SizedBox(height: 10,),
              Container(
                width: size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Faculty Id :  ${widget.fid}',style: TextStyle(color: Colors.white),),
                    Text('Faculty Name : ${widget.fmembername}',style: TextStyle(color: Colors.white),),
                    Text('Designation : ${widget.fdesignation}',style: TextStyle(color: Colors.white),),
                    Text('Department : ${widget.departmentname}',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Heading('Academic Qualification : ',16.0,size.width,Colors.grey,Colors.black),
              Text('${widget.facademicqualification}'),
              Heading('Teaching Area : ',16.0,size.width,Colors.grey,Colors.black),
              Text('${widget.fteachingarea}'),
              Heading('Research :',16.0,size.width,Colors.grey,Colors.black),
              Text(' ${widget.fresearch}'),
              Heading('Journal Publications :',16.0,size.width,Colors.grey,Colors.black),
              Text('${widget.fjournalpublication}')
            ],
          ),
        ),
      ),
    );
  }
}
