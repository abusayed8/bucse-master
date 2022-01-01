import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bucseproject/model/faculty_model.dart';
import 'package:bucseproject/widgets/notification_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthProvider extends ChangeNotifier {
  FacultyModel _facultyModel = FacultyModel();
  List<FacultyModel> _facultyList = [];
  List<FacultyModel> _facultyCategoryList = [];

  FacultyModel get facultyModel => _facultyModel;

  String? _loadingMgs;

  get facultyList => _facultyList;
  get facultyCategoryList => _facultyCategoryList;

  String get loadingMgs => _loadingMgs!;

  set facultyModel(FacultyModel model) {
    model = FacultyModel();
    _facultyModel = model;
    notifyListeners();
  }

  set loadingMgs(String val) {
    _loadingMgs = val;
    notifyListeners();
  }

  void clearFacultyList() {
    _facultyList.clear();
    notifyListeners();
  }
  void clearFacultyCategoryList() {
    _facultyCategoryList.clear();
    notifyListeners();
  }

  // Future<void> addFaculty(BuildContext context, FacultyModel facultyModel,
  //     GlobalKey<ScaffoldState> scaffoldKey) async {
  //   try {
  //     final int timeStamp = DateTime.now().millisecondsSinceEpoch;
  //     // String fid=facultyModel.fphone!+timeStamp.toString();
  //     String fid = facultyModel.fphone!;
  //     final String submitDate = DateFormat("dd-MMM-yyyy/hh:mm:aa")
  //         .format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
  //
  //     await FirebaseFirestore.instance.collection('faculty').doc(fid).set({
  //       'fid': fid,
  //       'fmembername': facultyModel.fmembername,
  //       'fphone': facultyModel.fphone,
  //       'departmentname': facultyModel.departmentname,
  //       'fimage': null,
  //       'fmemberemail': facultyModel.fmemberemail,
  //       'fdesignation': facultyModel.fdesignation,
  //       'facademicqualification': facultyModel.facademicqualification,
  //       'fteachingarea': facultyModel.fteachingarea,
  //       'fresearch': facultyModel.fresearch,
  //       'fjournalpublication': facultyModel.fjournalpublication,
  //       'submitdate': submitDate.toString(),
  //       'timestamp': timeStamp.toString(),
  //     });
  //     Navigator.pop(context);
  //     Navigator.pop(context);
  //     // showSnackBar(scaffoldKey, 'Question submitted successful',
  //     //     Theme.of(context).primaryColor);
  //     //return true;
  //   } catch (e) {}
  // }

  Future<void> getFaculty() async {
    //final String id = await getPreferenceId();
    try {
      await FirebaseFirestore.instance
          .collection('faculty')
          .where('id', isEqualTo: facultyModel.id)
          .get()
          .then((snapShot) {
        _facultyList.clear();
        snapShot.docChanges.forEach((element) {
          FacultyModel users = FacultyModel(
            id: element.doc['id'],
            fid: element.doc['fid'],
            fpassword: element.doc['fpassword'],
            fmembername: element.doc['fmembername'],
            fphone: element.doc['fphone'],
            departmentname: element.doc['departmentname'],
            fimage: element.doc['fimage'],
            fmemberemail: element.doc['fmemberemail'],
            fdesignation: element.doc['fdesignation'],
            facademicqualification: element.doc['facademicqualification'],
            fteachingarea: element.doc['fteachingarea'],
            fresearch: element.doc['fresearch'],
            fjournalpublication: element.doc['fjournalpublication'],
            submitdate: element.doc['submitdate'],
            timestamp: element.doc['timestamp'],
          );
          _facultyList.add(users);
        });
      });
      // print("Length: " + _facultyList.length.toString());
      notifyListeners();
    } catch (error) {
      error.toString();
    }
  }
  Future<void> getFacultyByCategory(String departmentname) async{
    try{
      await FirebaseFirestore.instance.collection('faculty').where('departmentname', isEqualTo: departmentname).get().then((snapShot){
        _facultyCategoryList.clear();
        snapShot.docChanges.forEach((element) {
          FacultyModel users=FacultyModel(
            id: element.doc['id'],
            fid: element.doc['fid'],
            fpassword: element.doc['fpassword'],
            fmembername: element.doc['fmembername'],
            fphone: element.doc['fphone'],
            departmentname: element.doc['departmentname'],
            fimage: element.doc['fimage'],
            fmemberemail: element.doc['fmemberemail'],
            fdesignation: element.doc['fdesignation'],
            facademicqualification: element.doc['facademicqualification'],
            fteachingarea: element.doc['fteachingarea'],
            fresearch: element.doc['fresearch'],
            fjournalpublication: element.doc['fjournalpublication'],
            submitdate: element.doc['submitdate'],
            timestamp: element.doc['timestamp'],
          );
          _facultyCategoryList.add(users);
        });
      });
      notifyListeners();
      print( _facultyCategoryList.length);
    }catch(error){'error.toString()';}
  }
// Future <void> getImages()async{
//   ///final String id = await getPreferenceId();
//   try{
//     await FirebaseFirestore.instance.collection('images').where('id',isEqualTo: imgModel.id)
//         .get().then((snapShot){
//       _imgList.clear();
//       snapShot.docChanges.forEach((element) {
//         ImgModel image=ImgModel(
//           id: element.doc['id'],
//           img: element.doc['img'],
//         );
//         _imgList.add(image);
//       });
//
//     });
//     print("Length: "+_userList.length.toString());
//     notifyListeners();
//   }
//   catch(error){}
// }
  ///update mage
  Future<void> addFaculty(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, AuthProvider authProvider,FacultyModel facultyModel, File imageFile)async{
      //final id = await getPreferenceId();
      // String fid = facultyModel.fphone!;
      final int timeStamp = DateTime.now().millisecondsSinceEpoch;
      String id = facultyModel.fphone!;
      final String submitDate = DateFormat("dd-MMM-yyyy/hh:mm:aa")
          .format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
      firebase_storage.Reference storageReference =
      firebase_storage.FirebaseStorage.instance.ref().child('Faculty Photo').child(id);

      firebase_storage.UploadTask storageUploadTask = storageReference.putFile(imageFile);

      firebase_storage.TaskSnapshot taskSnapshot;
      storageUploadTask.then((value) {
        taskSnapshot = value;
        taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl){
          final fimage = newImageDownloadUrl;
          FirebaseFirestore.instance.collection('faculty').doc(id).set({
            'id': id,
            'fid': facultyModel.fid,
            'fpassword': facultyModel.fpassword,
            'fmembername': facultyModel.fmembername,
            'fphone': facultyModel.fphone,
            'departmentname': facultyModel.departmentname,
            'fimage': fimage,
            'fmemberemail': facultyModel.fmemberemail,
            'fdesignation': facultyModel.fdesignation,
            'facademicqualification': facultyModel.facademicqualification,
            'fteachingarea': facultyModel.fteachingarea,
            'fresearch': facultyModel.fresearch,
            'fjournalpublication': facultyModel.fjournalpublication,
            'submitdate': submitDate.toString(),
            'timestamp': timeStamp.toString(),
          }).then((value)async{
            await authProvider.getFaculty();
            Navigator.pop(context);
            showSnackBar(scaffoldKey, 'Profile photo updated',Theme.of(context).primaryColor);
          });
        },onError: (error){
          Navigator.pop(context);
          showSnackBar(scaffoldKey, error.toString(), Colors.deepOrange);
        });
      },onError: (error){
        Navigator.pop(context);
        showSnackBar(scaffoldKey, error.toString(), Colors.deepOrange);
      });

    }
  Future<void> updateFacultyProfilePhoto(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, AuthProvider authProvider, File imageFile)async{
    //final id = await getPreferenceId();
    // String fid = facultyModel.fphone!;
    String fid = '01962518873';
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('Faculty Photo').child(fid);

    firebase_storage.UploadTask storageUploadTask = storageReference.putFile(imageFile);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl){
        final fimage = newImageDownloadUrl;
        FirebaseFirestore.instance.collection('faculty').doc(fid).update({
          'fimage':fimage,
        }).then((value)async{
          await authProvider.getFaculty();
          Navigator.pop(context);
          showSnackBar(scaffoldKey, 'Profile photo updated',Theme.of(context).primaryColor);
        });
      },onError: (error){
        Navigator.pop(context);
        showSnackBar(scaffoldKey, error.toString(), Colors.deepOrange);
      });
    },onError: (error){
      Navigator.pop(context);
      showSnackBar(scaffoldKey, error.toString(), Colors.deepOrange);
    });

  }

}
