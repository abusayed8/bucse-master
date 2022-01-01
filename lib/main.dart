import 'package:bucseproject/provider/auth_provider.dart';
import 'package:bucseproject/splesh_screanf.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'as firebase_core;
import 'package:provider/provider.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: spleshScreanflutter(),
        ));
  }
}
