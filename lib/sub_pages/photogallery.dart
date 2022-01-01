import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  ImagePicker image = ImagePicker();
  File? file;
  String uri = "";

  CameraImage() async {
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  GalleryImage() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    String imageName = DateTime.now().microsecondsSinceEpoch.toString();
    var imagefile =
        FirebaseStorage.instance.ref().child(imageName).child("/.jpg");
    UploadTask task = imagefile.putFile(file!);
    TaskSnapshot snapshot = await task;

    // for download the image
    uri = await snapshot.ref.getDownloadURL();

    /// store the image url into the firestore database
    await FirebaseFirestore.instance
        .collection("photogallery")
        .doc()
        .set({"img": uri});
    print(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),

              // Center(
              //   child: CircleAvatar(
              //     radius: 60,
              //     backgroundImage: file == null
              //         ? AssetImage("images/BU.png")
              //         : FileImage(File(file!.path)) as ImageProvider,
              //   ),
              // ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        CameraImage();
                      },
                      child: Text("Camera")),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        GalleryImage();
                      },
                      child: Text("Galery")),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        uploadFile();
                      },
                      child: Text("Upload Image")),
                ],
              )),
              SizedBox(
                height: 5,
              ),

              //// show the image into the app

              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("photogallery")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        primary: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          QueryDocumentSnapshot sn = snapshot.data!.docs[i];
                          if (snapshot.hasData) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => View(
                                              url: sn['img'],
                                            )));
                              },
                              child: Hero(
                                tag: sn['img'],
                                child: Card(
                                  child: Image.network(
                                    sn['img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  final url;

  View({this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: url, child: Image.network(url));
  }
}
