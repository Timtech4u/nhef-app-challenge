import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'package:nhef/pages/home.dart';
import 'package:nhef/pages/events.dart';
import 'package:nhef/pages/jobs.dart';
import 'package:nhef/pages/library.dart';
import 'package:nhef/pages/scholars.dart';
import 'package:nhef/pages/testimonial.dart';
import 'package:nhef/pages/universities.dart';
import 'package:nhef/widgets/icon_badge.dart';

class HomePage extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<HomePage> {
  PageController _pageController;
  int _page = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          EventsDisplay(),
          Scholars(),
          Home(),
          JobListing(),
          TestimonialListing(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.green,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.white,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.grey[300]),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.notifications,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.lightbulb_outline,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
