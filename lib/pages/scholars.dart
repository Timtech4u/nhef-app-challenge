import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class Scholars extends StatefulWidget {
  @override
  _ScholarsState createState() => _ScholarsState();
}

class _ScholarsState extends State<Scholars> {
  final String url = "https://nhef.herokuapp.com/api/v1/scholar/";

  Future<List<Scholar>> _fetchScholars() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Scholar> listOfScholars = items.map<Scholar>((json) {
        return Scholar.fromJson(json);
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
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Scholar>>(
        future: _fetchScholars(),
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
    );
  }
}

class ListingScreen extends StatelessWidget {
  final List<Scholar> scholars;
  ListingScreen(this.scholars);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: scholars.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:20.0),
              child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(child: Icon(Icons.school),),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("NAME : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(scholars[index].name,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("EMAIL : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(scholars[index].email,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("SCHOOL : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(scholars[index].school,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("SCHOOL YEAR : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(scholars[index].scholaryr,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("PHONE : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(scholars[index].phone,style: TextStyle(fontFamily: 'montserrat'),),
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
