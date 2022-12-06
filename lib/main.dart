import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home/home_screen.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/my_theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo",
      theme: MyTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
