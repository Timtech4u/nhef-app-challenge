import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:nhef/model/resources.dart';
import 'package:nhef/pages/home.dart';
import 'package:nhef/pages/events.dart';
import 'package:nhef/pages/jobs.dart';
import 'package:nhef/pages/library.dart';
import 'package:nhef/pages/scholars.dart';
import 'package:nhef/pages/testimonial.dart';
import 'package:nhef/pages/universities.dart';
import 'package:nhef/widgets/icon_badge.dart';

import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.33,
            color: Colors.green,
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(18, 30, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:14.0, right: 12.0),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top:14.0, right: 12.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          child: Image.asset('assets/images/scholar.png'),
                          backgroundColor: Color(0xFFf2f2f2),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "NHEF Alumni App",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              FittedBox(
                                child: Text(
                                  "Alunmi Network and Updates",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        FontAwesomeIcons.facebookF,
                                        color: Colors.green,
                                        size: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                      child: Icon(FontAwesomeIcons.google,
                                          color: Colors.green,
                                          size: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                      child: Icon(FontAwesomeIcons.twitter,
                                          color: Colors.green,
                                          size: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 230.0, left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventsDisplay()),
                        );
                      },
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.event,
                                size: 30,
                                color: Colors.green,
                              ),
                              Spacer(),
                              Text(
                                "Events",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LibraryResource()),
                        );
                      },
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.bookOpen,
                                size: 30,
                                color: Colors.red,
                              ),
                              Spacer(),
                              FittedBox(
                                  child: Text(
                                    "R-Library",
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scholars()),
                        );
                      },
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.newspaper,
                                size: 30,
                                color: Colors.orange,
                              ),
                              Spacer(),
                              FittedBox(
                                  child: Text(
                                    "News",
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scholars()),
                        );
                      },
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.school,
                                size: 30,
                                color: Colors.green,
                              ),
                              Spacer(),
                              Text(
                                "Scholars",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobListing()),
                          );
                        },
                        child: Material(
                          elevation: 0.0,
                          color: Color.fromRGBO(234, 250, 237, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 30,
                                ),
                                Spacer(),
                                FittedBox(
                                    child: Text(
                                      "Jobs",
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestimonialListing()),
                        );
                      },
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.list,
                                size: 30,
                                color: Colors.green,
                              ),
                              Spacer(),
                              Text(
                                "Spotlights",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.chartLine,
                                size: 30,
                                color: Colors.green,
                              ),
                              Spacer(),
                              Text(
                                "Surveys",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UniversityListing()),
                          );
                        },
                        child: Material(
                          elevation: 0.0,
                          color: Color.fromRGBO(234, 250, 237, 1),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.graduationCap,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                Spacer(),
                                FittedBox(
                                    child: Text(
                                      "Universities",
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Material(
                        elevation: 0.0,
                        color: Color.fromRGBO(234, 250, 237, 1),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.comments,
                                size: 30,
                                color: Colors.green,
                              ),
                              Spacer(),
                              Text(
                                "Feedback",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

