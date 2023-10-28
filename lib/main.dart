import 'package:b2b/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main()async {
  runApp(const MyApp());
    
 await Hive.initFlutter();
 await Hive.openBox("selectdeData");


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // canvasColor: Colors.amber,
        appBarTheme:const AppBarTheme(
          backgroundColor: Color(0xff4DD0E1),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          

        ),

        scaffoldBackgroundColor: Color(0xff80DEEA),
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
       
      ),
      home: LoginPage(),
      
    );
  }
}
