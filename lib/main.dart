import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:git_sample/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.cyan,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MyHomePage(),
//        SplashScreenAnim(),
      );
    });
  }
}
//
//class SplashScreenAnim extends StatefulWidget {
//  const SplashScreenAnim({Key? key}) : super(key: key);
//
//  @override
//  _SplashScreenAnimState createState() => _SplashScreenAnimState();
//}
//
//class _SplashScreenAnimState extends State<SplashScreenAnim> {
//  @override
//  Widget build(BuildContext context) {
//    return
//      SplashScreen(
//      seconds: 6,navigateAfterSeconds: MyHomePage(),
//      title: new Text('eQ Visiters',textScaleFactor: 2,),
//      image: new Image.asset('assets/splash_screen/n1.png'),backgroundColor: Colors.white,
//      loadingText: Text("Loading"),
//      photoSize: 100.0,
//      loaderColor: Colors.pink,
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
