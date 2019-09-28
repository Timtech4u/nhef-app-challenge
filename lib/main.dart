import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'package:nhef/pages/nav_resource.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NHEF App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Image.asset('assets/images/loader.gif'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Text("NHEF",style: TextStyle(fontFamily:'montserrat'),),
              
            ),
            Text("Get Access to Online Resources",style: TextStyle(fontFamily:'montserrat',fontStyle: FontStyle.italic),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 118.0, left: 50, right: 50),
          child: Center(
            child: Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.jpg', scale: 1.5),
                height: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * .5, size.height - 35.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
