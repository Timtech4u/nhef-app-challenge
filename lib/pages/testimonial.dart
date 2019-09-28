import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class TestimonialListing extends StatefulWidget {
  @override
  _TestimonialListingState createState() => _TestimonialListingState();
}

class _TestimonialListingState extends State<TestimonialListing> {
  final String url = "https://nhef.herokuapp.com/api/v1/testimonial/";
  Future<List<Testimonial>> _fetchtestimony() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Testimonial> listOfScholars = items.map<Testimonial>((json) {
        return Testimonial.fromJson(json);
      }).toList();
      print(items);

      return listOfScholars;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Testimonial>>(
          future: _fetchtestimony(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Image.asset(
                  "assets/images/loader.gif",
                  scale: 3.0,
                ),
              );

            return ListingScreen(snapshot.data);
          },
        ),
      ),
    );
  }
}

class ListingScreen extends StatelessWidget {
  final List<Testimonial> testimony;
  ListingScreen(this.testimony);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: testimony.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.list),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "NAME : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        testimony[index].name,
                                        style:
                                            TextStyle(fontFamily: 'montserrat'),
                                      ),
                                    ],
                                  ),
                                ),
                                  FittedBox(
                                  child: Row(
                                    children: <Widget>[
                                     Icon(Icons.calendar_view_day),
                                      Text(
                                        testimony[index].dateposted,
                                        style:
                                            TextStyle(fontFamily: 'montserrat'),
                                      ),
                                    ],
                                  ),
                                ),

                                
                               
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
