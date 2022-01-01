import 'dart:io';
import 'package:bucseproject/provider/auth_provider.dart';
import 'package:bucseproject/widgets/buttons.dart';
import 'package:bucseproject/widgets/form_decoration.dart';
import 'package:bucseproject/widgets/notification_widgets.dart';
import 'package:bucseproject/widgets/static_variables.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class AddFaculty extends StatefulWidget {
  const AddFaculty({Key? key}) : super(key: key);

  @override
  _AddFacultyState createState() => _AddFacultyState();
}

class _AddFacultyState extends State<AddFaculty> {
  GlobalKey <ScaffoldState> _scaffoldKey=GlobalKey();
  final _formKey=GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  File? _image;
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider=Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title:Text('Add Faculty'),centerTitle: true,),
      body: _bodyUI(authProvider),
    );
  }
  Widget _bodyUI(AuthProvider authProvider){
    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            child: _image !=null ?Image.file(
            _image!,
            width: size.width,
            height: size.height * 0.3,
            fit: BoxFit.contain,
          ):Image.asset('images/user.png',width: size.width ,
            height: size.height * 0.3,
            fit: BoxFit.fill,),
          ),
          SizedBox(height:size.width*0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(
               onPressed:(){
                 _getImageFromCamera(authProvider);
               } ,
               icon: Icon(Icons.camera_alt,size: 40,),
               color: Colors.blue,
             ),
             SizedBox(width:size.width*0.08),

             IconButton(
               onPressed:(){
                 _getImageFromGallery(authProvider);
                 } ,
               icon: Icon(Icons.image,size: 40,),
               color: Colors.blue,
             ),
           ],
          ),
          Divider(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Name',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Phone Number',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Faculty ID',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Password',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Email',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Designation',authProvider),
                SizedBox(height:size.width*0.08),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  decoration: BoxDecoration(
                    // color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                          color: Colors.black,
                          width: 3
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value:  authProvider.facultyModel.departmentname,

                      hint: Container(
                        width: size.width*.75,
                        child: Text('Select Departent',style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: size.height*0.023)),
                      ),
                      items: StaticVariables.departments.map((gender){
                        return DropdownMenuItem(
                          child: Container(
                            width: size.width*.75,
                            child: Text(gender,style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,)),
                          ),
                          value: gender,
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          authProvider.facultyModel.departmentname = newValue as String?;
                        });
                      },
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
                //_textFieldBuilder('Department',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Academic Qualification',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Teaching Area',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Research',authProvider),
                SizedBox(height:size.width*0.08),
                _textFieldBuilder('Journal Publication',authProvider),
                SizedBox(height:size.width*0.08),

                InkWell(
                  onTap: ()async{
                    if(_formKey.currentState!.validate()){
                      authProvider.loadingMgs = 'Submitting information...';
                      showLoadingDialog(context,authProvider);
                      // Navigator.pop(context);
                      await authProvider.addFaculty(_scaffoldKey,context, authProvider,authProvider.facultyModel, _image!);
                      // Navigator.pu(context, MaterialPageRoute(builder: (context)=>AddFaculty()));
                    }
                    },
                  child: button(context,'Submit'),
                )
              ],
            ),

          ),

        ],
      ),
      ),
    );
  }
  Widget _textFieldBuilder(String hintTxt,AuthProvider authProvider){
    Size size=MediaQuery.of(context).size;
    return  TextFormField(
      keyboardType: hintTxt=='Phone Number'?TextInputType.phone
          : hintTxt=='Faculty ID'?TextInputType.phone
          :TextInputType.text,
      decoration: FormDecoration.copyWith(
          labelText: hintTxt,
          labelStyle: TextStyle(
              fontSize: size.height*0.023
          ),

          // suffixIcon: hintTxt=='Password'? IconButton(
          //     icon: obscure
          //         ? Icon(Icons.visibility_off_rounded)
          //         : Icon(Icons.remove_red_eye),
          //     onPressed: () =>
          //         setState(() => obscure = !obscure)):null
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Fill All filled';
        }
        return null;
      },
      onChanged: (value){
        setState(() {
          hintTxt=='Name'?authProvider.facultyModel.fmembername=value
              :hintTxt=='Phone Number'?authProvider.facultyModel.fphone=value
              :hintTxt=='Faculty ID'?authProvider.facultyModel.fid=value
              :hintTxt=='Password'?authProvider.facultyModel.fpassword=value
              :hintTxt=='Email'?authProvider.facultyModel.fmemberemail=value
              :hintTxt=='Designation'?authProvider.facultyModel.fdesignation=value
              :hintTxt=='Academic Qualification'?authProvider.facultyModel.facademicqualification=value
              :hintTxt=='Teaching Area'?authProvider.facultyModel.fteachingarea=value
              :hintTxt=='Research'?authProvider.facultyModel.fresearch=value
              :authProvider.facultyModel.fjournalpublication=value;
        });
      },

    );
  }
  Future<void> _getImageFromGallery(AuthProvider authProvider)async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxWidth: 300,maxHeight: 300);
    if(pickedFile!=null){
      setState(() {
        _image = File(pickedFile.path);
      });
    }else {
     // showSnackBar(_scaffoldKey, 'No image selected', Colors.deepOrange);
      Navigator.pop(context);
    }
  }
Future<void> _getImageFromCamera(AuthProvider authProvider)async{
    final pickedFile = await picker.pickImage(source: ImageSource.camera,maxWidth: 300,maxHeight: 300);
    if(pickedFile!=null){
      setState(() {
        _image = File(pickedFile.path);
      });
    }else {
     // showSnackBar(_scaffoldKey, 'No image selected', Colors.deepOrange);
      Navigator.pop(context);
    }

  }
}
