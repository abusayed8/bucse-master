import 'package:bucseproject/add_database/add_faculty.dart';
import 'package:bucseproject/data/faculty_data.dart';
import 'package:bucseproject/model/faculty_model.dart';
import 'package:bucseproject/provider/auth_provider.dart';
import 'package:bucseproject/sub_pages/faculty_member_details.dart';
import 'package:bucseproject/widgets/form_decoration.dart';
import 'package:bucseproject/widgets/notification_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FacultyMemberList extends StatefulWidget {
String? departmentname;
  @override
  _FacultyMemberListState createState() => _FacultyMemberListState();

FacultyMemberList({this.departmentname});
}

class _FacultyMemberListState extends State<FacultyMemberList> {
  // List<FacultyModel> faculty = <FacultyModel>[];
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   faculty = GetFaculty();
  // }

int _counter=0;
List<FacultyModel> facultyList=[];
List<FacultyModel> filterList=[];
void _customInitState(AuthProvider authProvider){
  setState(() {
    facultyList=authProvider.facultyCategoryList;
    filterList=facultyList;
    _counter++;
  });
  authProvider.getFacultyByCategory('${widget.departmentname}');
}
void _filterFacultyList(String searchItem){
  setState(() {
    filterList=facultyList.where((element) => (element.fmembername!.toLowerCase().contains(searchItem.toLowerCase()))).toList();
  });
}
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider=Provider.of<AuthProvider>(context);
    if(_counter==0)_customInitState(authProvider);

    //authProvider.getFaculty();
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.departmentname}'),
        centerTitle: true,
      ),
      body: _bodyUI(authProvider),
    );
  }
  Widget _bodyUI(AuthProvider authProvider){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: TextField(
            onChanged: _filterFacultyList,
            decoration: InputDecoration(
              hintText: 'Search faculty member.....',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacultyMemberDetails(
                            id: filterList[index].id,
                            fid: filterList[index].fid,
                            fphone: filterList[index].fphone,
                            fpassword: filterList[index].fpassword,
                            fmembername: filterList[index].fmembername,
                            fmemberemail: filterList[index].fmemberemail,
                            fdesignation: filterList[index].fdesignation,
                            fimage: filterList[index].fimage,
                            departmentname: filterList[index].departmentname,
                            facademicqualification:
                            filterList[index].facademicqualification,
                            fteachingarea: filterList[index].fteachingarea,
                            fresearch: filterList[index].fresearch,
                            fjournalpublication: filterList[index].fjournalpublication,
                          )));
                },
                child: Container(
                  height: size.height * 0.13,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.01,
                      vertical: size.height * 0.005),
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.009),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size.height*0.012),
                      border: Border.all(
                          color: Colors.grey,
                          width: 2
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      filterList[index].fimage!=null ?Image.network(
                        '${filterList[index].fimage}',
                        width: size.width * 0.3,
                        height: size.height * 0.12,
                        fit: BoxFit.fill,
                      ):Image.asset('images/user.png',width: size.width * 0.3,
                        height: size.height * 0.12,
                        fit: BoxFit.fill,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${filterList[index].fmembername}',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),maxLines: 2,),
                            SizedBox(height: 5,),
                            Text('${filterList[index].fdesignation}',style: TextStyle(fontSize:14),maxLines: 1,),
                            SizedBox(height: 5,),
                            Text('${filterList[index].departmentname}',style: TextStyle(fontSize:14),maxLines: 1,),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
