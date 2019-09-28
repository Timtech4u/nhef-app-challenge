import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;


class LibraryResource extends StatefulWidget {
  @override
  _LibraryResourceState createState() => _LibraryResourceState();
}

class _LibraryResourceState extends State<LibraryResource> {
    final String url = "https://nhef.herokuapp.com/api/v1/resource/";

  Future<List<Resource>> _fetchResources() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Resource> listOfResource = items.map<Resource>((json) {
        return Resource.fromJson(json);
      }).toList();
      print(items);

      return listOfResource;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Resource>>(
        future: _fetchResources(),
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
   final List<Resource> resource;
  ListingScreen(this.resource);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: resource.length,
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
                                        "TITLE : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        resource[index].title.toString(),
                                        style:
                                            TextStyle(fontFamily: 'montserrat'),
                                      ),
                                    ],
                                  ),
                                ),
                                  FittedBox(
                                  child: Row(
                                    children: <Widget>[
                                     Icon(Icons.description),
                                      Text(
                                        resource[index].detail,
                                        style:
                                            TextStyle(fontFamily: 'montserrat'),
                                      ),
                                    ],
                                  ),
                                ),

                                 FittedBox(
                                  child: Row(
                                    children: <Widget>[
                                     Icon(Icons.web),
                                      Text(
                                        resource[index].url,
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