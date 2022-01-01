import 'package:bucseproject/add_database/add_faculty.dart';
import 'package:bucseproject/provider/auth_provider.dart';
import 'package:bucseproject/sub_pages/faculty_member_list.dart';
import 'package:bucseproject/widgets/notification_widgets.dart';
import 'package:bucseproject/widgets/static_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Departments extends StatefulWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider=Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFaculty()));
            //Navigator.pop(context);
          },
          label: Text('Add Faculty')),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .85,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: size.height * .12,
                    mainAxisSpacing: size.height * .01,
                    crossAxisSpacing: size.width * .015),
                itemCount: StaticVariables.departments.length,
                itemBuilder: (context, index) {
                  return GridBuilderTile(index: index);
                }),
          )
        ],
      ),
    );
  }
}

class GridBuilderTile extends StatelessWidget {
  int? index;

  GridBuilderTile({this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FacultyMemberList(
                departmentname:StaticVariables.departments[index!]
            )));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(color: Colors.white70, blurRadius: 1, spreadRadius: 1)
            ]),
        alignment: Alignment.center,
        child: Text(
          StaticVariables.departments[index!],
          style: TextStyle(fontSize: size.height * .023),
        ),
      ),
    );
  }
}
